<template>
  <div class="create-container">
    <div class="article-title">
      <el-row :gutter="20">
        <el-col :span="20">
          <el-input
            size="medium"
            placeholder="请输入文章标题"
            v-model="article.title"
          ></el-input>
        </el-col>
        <el-col :span="4" style="text-align: center">
          <el-button
            type="danger"
            @click="showDrawer"
            size="medium"
            icon="el-icon-edit-outline"
          >
            保存草稿
          </el-button>
          <el-button
            size="medium"
            type="primary"
            @click="showDrawer"
            icon="el-icon-s-promotion"
          >
            发布文章
          </el-button>
        </el-col>
      </el-row>
    </div>
    <!-- 博客区域 -->
    <mavon-editor
      ref="mdedit"
      v-model="article.contentMd"
      @imgAdd="handleImgAdd"
      @imgDel="handleImgDel"
      class="article-content"
    />

    <!--  文章信息抽屉  -->
    <el-drawer
      title="文章设置"
      :visible.sync="drawerVisible"
      :wrapperClosable="false"
    >
      <el-form
        label-width="80px"
        label-position="left"
        :model="article"
        style="margin-left: 20px; margin-right: 20px"
      >
        <!-- 文章标题 -->
        <el-form-item label="文章标题">
          <el-input
            size="small"
            placeholder="请输入文章标题"
            v-model="article.title"
          ></el-input>
        </el-form-item>
        <!-- 发表时间 -->
        <el-form-item label="发布时间">
          <el-date-picker
            size="small"
            v-model="article.publishTime"
            type="datetime"
            placeholder="选择日期"
            style="width: 100%"
            value-format="yyyy-MM-dd HH:mm:ss"
          >
          </el-date-picker>
        </el-form-item>
        <!-- 是否开启评论 -->
        <el-form-item label="开启评论">
          <el-radio-group v-model="article.allowComment">
            <el-radio :label="true">开启</el-radio>
            <el-radio :label="false">关闭</el-radio>
          </el-radio-group>
        </el-form-item>
        <!-- 是否置顶 -->
        <el-form-item label="是否置顶">
          <el-radio-group v-model="article.top">
            <el-radio :label="true">是</el-radio>
            <el-radio :label="false">否</el-radio>
          </el-radio-group>
        </el-form-item>
        <!-- 摘要 -->
        <el-form-item label="文章摘要">
          <el-input
            placeholder="在这里输入摘要，如不填写，会从文章中自动获取"
            style="margin-bottom: 10px"
            type="textarea"
            v-model="article.summary"
            rows="5"
          ></el-input>
        </el-form-item>
        <!-- 文章类型 -->
        <el-form-item label="文章类型">
          <el-select
            v-model="article.type"
            placeholder="请选择文章分类"
            size="small"
            style="width: 100%"
          >
            <el-option
              v-for="item in typeList"
              :key="item.code"
              :label="item.description"
              :value="item.code"
            >
            </el-option>
          </el-select>
        </el-form-item>
        <!-- 分类目录 -->
        <el-form-item label="分类目录">
          <el-select
            v-model="article.category"
            placeholder="请选择文章分类"
            size="small"
            style="width: 100%"
          >
            <el-option
              v-for="item in categories"
              :key="item.id"
              :label="item.name"
              :value="item.id"
            >
            </el-option>
          </el-select>
        </el-form-item>
        <!-- 文章标签 -->
        <el-form-item label="文章标签">
          <el-select
            v-model="article.tags"
            style="width: 100%"
            placeholder="在这里输入文章标签，按下回车自动添加标签"
            size="small"
            @keyup.enter.native="saveTag"
            allow-create
            filterable
            default-first-option
            multiple
          >
            <el-option
              v-for="item in tags"
              :key="item.id"
              :label="item.name"
              :value="item.name"
            >
            </el-option>
          </el-select>
        </el-form-item>
        <!-- 文章封面 -->
        <el-form-item label="文章封面">
          <el-row>
            <el-button
              size="small"
              icon="el-icon-picture"
              @click="handleChoose"
            >
              选择本地
            </el-button>
            <el-button
              type="primary"
              size="small"
              icon="el-icon-upload"
              @click="handleUpload"
            >
              上传图片
            </el-button>
          </el-row>
          <el-row>
            <el-empty
              v-if="!article.background"
              :image-size="100"
              description="暂无图片"
            ></el-empty>
            <el-image
              v-else
              style="margin-top: 10px; height: 200px; width: 100%"
              :src="article.background"
              fit="contain"
            ></el-image>
          </el-row>
        </el-form-item>
      </el-form>
      <!-- 发布文章按钮 -->
      <div class="drawer-footer">
        <el-button
          type="danger"
          @click="saveDraft"
          size="small"
          icon="el-icon-edit-outline"
        >
          保存草稿
        </el-button>
        <el-button
          type="primary"
          @click="save"
          size="small"
          icon="el-icon-s-promotion"
        >
          发布文章
        </el-button>
      </div>
    </el-drawer>

    <!-- 选择图片对话框 -->
    <el-dialog
      title="本地图片"
      :visible="choose"
      :before-close="handleClose"
      width="1000"
    >
      <picture-view v-bind:url="fileUrl" @func="uploadFileUrl"></picture-view>
      <span slot="footer">
        <el-button type="primary" @click="sbumitChoose">确定</el-button>
        <el-button @click="handleClose">取消</el-button>
      </span>
    </el-dialog>

    <!-- 上传文件对话框 -->
    <upload v-bind:visible="uploadDialog" @func="handleDialogClose"></upload>
  </div>
</template>

<script>
import dayjs from "dayjs";
import PictureView from "@/components/PictureView/index.vue";
import { upload } from "@/api/picture";
import { deleteFileByPath } from "@/api/file";
import Upload from "@/components/Upload";
import {
  getAllCategory,
  getAllTags,
  insertTags,
  saveArticle,
} from "@/api/article";

export default {
  name: "CreateArticle",
  components: { PictureView, Upload },
  data() {
    return {
      article: {
        // 博客标题
        title: "",
        // 博客文本数据
        contentMd: "",
        // 博客文本HTML数据
        // contentHtml: "",
        // 文章发布时间
        publishTime: undefined,
        // 是否开启评论
        allowComment: true,
        // 是否置顶
        top: false,
        // 文章摘要
        summary: "",
        // 分类目录
        category: undefined,
        // 文章标签
        tags: [],
        // 文章封面
        background: "",
        // 文章类型
        type: 1,
        // 文章是否删除
        deleted: false,
        // 文章状态：0 草稿 1 已发布 2 回收站
        state: 1,
      },
      // 文章类型
      typeList: [
        {
          code: 1,
          description: "原创",
        },
        {
          code: 2,
          description: "转载",
        },
        {
          code: 3,
          description: "翻译",
        },
      ],
      // 抽屉是否展示
      drawerVisible: false,
      // 文章分类
      categories: [],
      // 文章标签
      tags: [],
      // 图片选择对话框
      choose: false,
      // 图片路径
      fileUrl: "",
      // 文件上传对话框
      uploadDialog: false,
    };
  },

  mounted() {
    this.article.title = this.dateFormat(new Date());
  },

  methods: {
    // 绑定添加图片调用的方法
    handleImgAdd(pos, $file) {
      let formData = new FormData();
      formData.append("file", $file);
      formData.append("filePath", "article/");
      upload(formData).then((result) => {
        // 替换上传文件的回显路径
        this.$refs.mdedit.$img2Url(pos, result);
      });
    },
    // 删除图片调用的方法
    handleImgDel(pos) {
      // markdown中的图片是一个数组，可以直接通过pos[0]取出图片路径
      deleteFileByPath({ path: pos[0] }).then(() => {});
    },
    // 获取标签数据
    getTags() {
      getAllTags().then((result) => {
        this.tags = result;
      });
    },
    // 打开抽屉对话框
    showDrawer() {
      // 打开抽屉对话框时获取文章的分类信息
      getAllCategory().then((result) => {
        this.categories = result;
      });
      // 获取标签数据
      this.getTags();
      this.drawerVisible = true;
    },
    // 保存自定义标签方法
    saveTag() {
      let length = this.article.tags.length;
      insertTags({ name: this.article.tags[length - 1] }).then(() => {
        // 刷新标签栏数据
        this.getTags();
      });
    },
    // 保存草稿箱事件
    saveDraft() {
      // 修改文章状态为草稿
      this.article.state = 0;
      this.save();
    },
    // 发布文章方法
    save() {
      // 如果当前用户没有写摘要
      if (!this.article.summary) {
        // 截取摘要
        this.article.summary = this.article.contentMd
          // 截取文本内容的前50个字符作为摘要
          .substring(0, 100)
          // 使用正则表达式将截取后的文本内容换行替换为空格
          .replace(/\r|\n/gi, " ");
      }
      // 发布文章
      saveArticle(this.article).then(() => {
        // 重置当前文章对象
        this.reset();
      });
    },
    // 选择本地图片
    handleChoose() {
      this.choose = true;
    },
    // 关闭选择图片对话框
    handleClose() {
      this.choose = false;
    },
    // 确定选择
    sbumitChoose() {
      if (this.fileUrl) {
        this.$message.success("图片选择成功");
        // 将选择的图片赋值给当前文章的图片
        this.article.background = this.fileUrl;
      } else {
        this.fileUrl = "";
        this.article.background = "";
        this.$message.info("取消选择图片");
      }
      // 关闭对话框
      this.handleClose();
    },
    // 更新图片的路径
    uploadFileUrl(val) {
      this.fileUrl = val;
    },
    // 重置当前文章对象
    reset() {
      // 博客标题
      this.article.title = "";
      // 博客文本数据
      this.article.contentMd = "";
      // 文章发布时间
      this.article.publishTime = undefined;
      // 是否开启评论
      this.article.allowComment = true;
      // 是否置顶
      this.article.top = false;
      // 文章摘要
      this.article.summary = "";
      // 分类目录
      this.article.category = undefined;
      // 文章标签
      this.article.tags = [];
      // 文章封面
      this.article.background = "";
      // 文章类型
      this.article.type = 1;
      // 文章是否删除
      this.article.deleted = false;
      // 文章状态：0 草稿 1 已发布
      this.article.state = undefined;
    },
    // 关闭对话框
    handleDialogClose() {
      this.uploadDialog = false;
    },
    // 处理上传文件方法
    handleUpload() {
      this.uploadDialog = true;
    },
    // 格式化时间
    dateFormat(date) {
      // 使用 dayjs 处理时间
      return dayjs(date).format("YYYY-MM-DD hh:ss");
    },
  },
};
</script>

<style lang="scss" scoped>
.create-container {
  margin-top: 10px;

  .article-title {
    width: 100%;
    margin-bottom: 10px;
  }
  .article-content {
    margin-top: 20px;
    height: calc(100vh - 200px);
  }
  .el-form-item {
    margin-bottom: 10px;
  }
  .drawer-footer {
    float: right;
    margin-right: 10px;
    margin-bottom: 10px;
    position: relative;
    top: 30px;
  }
}
</style>
