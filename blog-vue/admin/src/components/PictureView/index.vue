<template>
  <div class="picture-container">
    <el-card shadow="never">
      <div class="picture-body">
        <!-- 照片列表 -->
        <el-row :gutter="10" class="file-container">
          <!-- 空状态 -->
          <el-empty v-if="filesList.length == 0" description="暂无图片" />
          <el-checkbox-group
            v-model="selectFilesList"
            @change="handleCheckedFilesChange"
          >
            <el-col :md="6" v-for="item of filesList" :key="item.id">
              <el-checkbox :label="item.url">
                <div class="file-item">
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
          :page-sizes="[8, 16, 24, 32]"
          :page-size="5"
          layout="total, sizes, prev, pager, next, jumper"
          :total="total"
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
        >
        </el-pagination>
      </div>
    </el-card>
  </div>
</template>

<script>
import { getFilesList } from "@/api/picture.js";

export default {
  name: "PictureView",
  props: {
    url: {
      type: String,
      default: "",
    },
  },
  data() {
    return {
      // 上传用户
      nickName: "",
      // 上传时间
      times: undefined,
      // 当前页数
      curPage: 1,
      // 页面大小
      size: 8,
      // 数据总数
      total: 0,
      // 用户数据
      filesList: [],
      // 开始时间
      startTime: "",
      // 结束时间
      endTime: "",
      // 选中的图片路径
      selectFilesList: [],
    };
  },

  mounted() {
    this.getFilesData();
  },
  watch: {
    url(val) {
      // 监听变更并同步
      this.fileUrl = val;
    },
  },

  methods: {
    getFilesData() {
      getFilesList({
        curPage: this.curPage,
        size: this.size,
        nickName: this.nickName,
        startTime: this.startTime,
        endTime: this.endTime,
      }).then((result) => {
        this.filesList = result.list;
        this.total = result.total;
      });
    },
    // 多选图片时的选项
    handleCheckedFilesChange() {
      if (this.selectFilesList.length >= 2) {
        this.$message.error("只能选择一张图片");
        this.selectFilesList = [];
      }
      this.fileUrl = this.selectFilesList[0];
      //组件内变更后向外部发送事件通知
      this.$emit("func", this.fileUrl);
    },
    // 当页面大小发生变化时
    handleSizeChange(val) {
      this.size = val;
      // 重新获取数据
      this.getFilesData();
    },
    // 当前页发生变化时
    handleCurrentChange(val) {
      this.curPage = val;
      // 重新获取数据
      this.getFilesData();
    },
  },
};
</script>

<style lang="scss" scoped>
.picture-container {
  margin-top: 10px;
  .picture-body {
    margin: 30px 15px 30px 15px;
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
}
</style>
