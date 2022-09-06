<template>
  <div class="picture-container">
    <el-card shadow="never">
      <div class="picture-header">
        <el-form :inline="true">
          <el-form-item>
            <span class="title-label">上传用户</span>
            <el-input
              v-model="nickName"
              placeholder="请输入用户名称"
              style="width: 230px"
            ></el-input>
          </el-form-item>

          <el-form-item>
            <span class="title-label">上传时间</span>
            <el-date-picker
              v-model="times"
              type="daterange"
              value-format="yyyy-MM-dd"
              align="right"
              unlink-panels
              range-separator="至"
              start-placeholder="开始日期"
              end-placeholder="结束日期"
              :picker-options="pickerOptions"
            >
            </el-date-picker>
          </el-form-item>

          <el-form-item style="margin-left: 25px">
            <el-button
              type="primary"
              icon="el-icon-search"
              size="mini"
              @click="handleQuery"
              >搜索
            </el-button>
            <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">
              重置
            </el-button>
          </el-form-item>
        </el-form>

        <div class="button-container">
          <el-row>
            <el-col :span="2">
              <el-button
                type="primary"
                plain
                icon="el-icon-picture"
                size="mini"
                @click="handleUpload"
              >
                上传图片
              </el-button>
            </el-col>

            <el-col :span="2">
              <el-button type="danger" plain icon="el-icon-delete" size="mini">
                批量删除
              </el-button>
            </el-col>
          </el-row>

          <span class="file-count">已选择{{ selectFilesList.length }}张</span>
          <el-checkbox
            class="all-check"
            v-model="checkAll"
            @change="handleCheckAllChange"
          >
            全选
          </el-checkbox>
        </div>
      </div>

      <div class="picture-body">
        <!-- 照片列表 -->
        <el-row :gutter="10" class="file-container">
          <!-- 空状态 -->
          <el-empty v-if="filesList.length == 0" description="暂无图片" />
          <el-checkbox-group
            v-model="selectFilesList"
            @change="handleCheckedFilesChange"
          >
            <el-col :md="3" v-for="item of filesList" :key="item.id">
              <el-checkbox :label="item.id">
                <div class="file-item">
                  <!--  图片操作  -->
                  <div class="file-opreation">
                    <el-dropdown @command="handleCommand">
                      <i class="el-icon-more" style="color: #fff" />
                      <el-dropdown-menu slot="dropdown">
                        <el-dropdown-item :command="item">
                          <i class="el-icon-edit" />编辑
                        </el-dropdown-item>
                      </el-dropdown-menu>
                    </el-dropdown>
                  </div>
                  <el-image :src="item.url" fit="cover" class="file-img" />
                  <!--  照片名称  -->
                  <div class="file-name">{{ item.fileName }}</div>
                </div>
              </el-checkbox>
            </el-col>
          </el-checkbox-group>
        </el-row>
      </div>

      <div class="file-footer">
        <el-pagination
          :page-sizes="[10, 20, 30, 40, 50]"
          :page-size="20"
          layout="total, sizes, prev, pager, next, jumper"
          :total="total"
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
        >
        </el-pagination>
      </div>
    </el-card>

    <el-dialog
      title="详细信息"
      :visible="dialogShow"
      width="500px"
      :before-close="handleDialogClose"
    >
      <el-form>
        <el-form-item label="图片名称" label-width="80px">
          <el-input v-model="file.fileName" disabled></el-input>
        </el-form-item>
        <el-form-item label="上传用户" label-width="80px">
          <el-input v-model="file.user"></el-input>
        </el-form-item>
        <el-form-item label="文件路径" label-width="80px">
          <el-input v-model="file.url" disabled></el-input>
        </el-form-item>
        <el-form-item label="上传时间" label-width="80px">
          <el-input v-model="file.uploadTime" disabled></el-input>
        </el-form-item>
        <el-form-item label="备注" label-width="80px">
          <el-input type="textarea" v-model="file.description"></el-input>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <!-- @click="submitForm" -->
        <el-button type="primary">确定</el-button>
        <el-button @click="handleDialogClose">取消</el-button>
      </span>
    </el-dialog>

    <!--  上传文件  -->
    <upload v-bind:visible="uploadDialog" @func="handleDialogClose"></upload>
  </div>
</template>

<script>
import { getFilesList } from "@/api/picture.js";
import Upload from "../../components/Upload";

export default {
  name: "PictureList",
  components: { Upload },
  data() {
    return {
      // 上传文件快捷选项
      pickerOptions: {
        shortcuts: [
          {
            text: "最近一周",
            onClick(picker) {
              const end = new Date();
              const start = new Date();
              start.setTime(start.getTime() - 3600 * 1000 * 24 * 7);
              picker.$emit("pick", [start, end]);
            },
          },
          {
            text: "最近一个月",
            onClick(picker) {
              const end = new Date();
              const start = new Date();
              start.setTime(start.getTime() - 3600 * 1000 * 24 * 30);
              picker.$emit("pick", [start, end]);
            },
          },
          {
            text: "最近三个月",
            onClick(picker) {
              const end = new Date();
              const start = new Date();
              start.setTime(start.getTime() - 3600 * 1000 * 24 * 90);
              picker.$emit("pick", [start, end]);
            },
          },
        ],
      },
      // 上传用户
      nickName: "",
      // 上传时间
      times: undefined,
      // 当前页数
      curPage: 1,
      // 页面大小
      size: 10,
      // 数据总数
      total: 0,
      // 用户数据
      filesList: [],
      // 开始时间
      startTime: "",
      // 结束时间
      endTime: "",
      // 选中的片ID
      selectFilesList: [],
      // 当前所有图片的ID
      filesIds: [],
      // 是否选中所有图片
      checkAll: false,
      // 详细对话框
      dialogShow: false,
      // 文件信息对象
      file: {},
      // 文件上传对话框
      uploadDialog: false,
    };
  },

  mounted() {
    this.getFilesData();
  },

  methods: {
    getFilesData() {
      // 清除所有选中的节点
      this.filesIds = [];
      if (this.times) {
        this.startTime = this.times[0];
        this.endTime = this.times[1];
      }
      getFilesList({
        curPage: this.curPage,
        size: this.size,
        nickName: this.nickName,
        startTime: this.startTime,
        endTime: this.endTime,
      }).then((result) => {
        this.filesList = result.list;
        this.total = result.total;

        this.filesList.forEach((item) => {
          this.filesIds.push(item.id);
        });
      });
    },
    // 点击了搜索按钮
    handleQuery() {
      this.getFilesData();
    },
    // 点击了重置按钮
    resetQuery() {
      this.times = [];
      this.nickName = "";
      this.times = undefined;
      this.startTime = "";
      this.endTime = "";
    },
    // 处理上传
    handleUpload() {
      this.uploadDialog = true;
    },
    // 多选图片时的选项
    handleCheckedFilesChange() {},
    // 点击了图片的编辑按钮
    handleCommand(item) {
      this.file = item;
      this.dialogShow = true;
    },
    // 全选
    handleCheckAllChange(val) {
      this.selectFilesList = val ? this.filesIds : [];
    },
    // 当页面大小发生变化时
    handleSizeChange(val) {
      this.size = val;
      // 清空当前所有的图片ID
      this.filesIds = [];
      // 重新获取数据
      this.getFilesData();
    },
    // 当前页发生变化时
    handleCurrentChange(val) {
      this.curPage = val;
      // 清空当前所有的图片ID
      this.filesIds = [];
      // 重新获取数据
      this.getFilesData();
    },
    // 关闭对话框
    handleDialogClose() {
      this.file = {};
      this.uploadList = [];
      this.dialogShow = false;
      this.uploadDialog = false;
    },
  },
};
</script>

<style lang="scss" scoped>
.picture-container {
  margin-top: 10px;

  .picture-header {
    margin-top: 10px;
    padding-left: 15px;

    .title-label {
      font-size: 14px;
      font-weight: 700;
      color: #606266;
      margin-right: 12px;
    }
  }

  .picture-body {
    margin: 30px 15px 30px 15px;
  }

  .picture-footer {
    padding-left: 15px;
    margin-top: 40px;
  }

  .file-img {
    width: 100%;
    height: 7rem;
    border-radius: 4px;
  }

  .file-item {
    width: 100%;
    position: relative;
    cursor: pointer;
    margin-bottom: 1rem;
  }

  .file-name {
    font-size: 14px;
    margin-top: 0.3rem;
    text-align: center;
  }
  .file-opreation {
    position: absolute;
    z-index: 1000;
    top: 0.3rem;
    right: 0.5rem;
  }
  .all-check {
    float: right;
    display: inline-flex;
    align-items: center;
    margin-right: 1rem;
  }
  .file-count {
    float: right;
    font-size: 14px;
    line-height: 20px;
    margin-right: 1rem;
  }
}
</style>
