<template>
  <div>
    <el-form label-position="left" label-width="90px">
      <el-row :gutter="5">
        <el-col :span="5">
          <el-form-item label="网站头像"
            ><el-upload action="#" list-type="picture-card">
              <img
                src="https://www.zrkizzy.com/upload/2021/11/header-90431fbd9cf848e2a5aaea0bf6b1089b.jpg"
                width="100%"
              />
            </el-upload>
          </el-form-item>
        </el-col>
        <el-col :span="2">
          <el-row>
            <el-button
              plain
              style="margin-top: 20px; margin-bottom: 10px"
              type="primary"
              icon="el-icon-upload"
            >
              上传文件
            </el-button>
          </el-row>
          <el-row>
            <el-button icon="el-icon-picture" plain> 选择本地 </el-button>
          </el-row>
        </el-col>
      </el-row>
      <!-- 网站名称 -->
      <el-row :gutter="5">
        <el-col :span="8">
          <el-form-item label="网站名称">
            <el-input size="small"></el-input>
          </el-form-item>
        </el-col>
      </el-row>
      <!-- 网站作者 -->
      <el-row :gutter="5">
        <el-col :span="8">
          <el-form-item label="网站作者">
            <el-input size="small"></el-input>
          </el-form-item>
        </el-col>
      </el-row>
      <!-- 网站简介 -->
      <el-row :gutter="5">
        <el-col :span="8">
          <el-form-item label="网站简介">
            <el-input size="small"></el-input>
          </el-form-item>
        </el-col>
      </el-row>
      <!-- 创建日期 -->
      <el-row :gutter="5">
        <el-col :span="8">
          <el-form-item label="创建日期">
            <el-input size="small"></el-input>
          </el-form-item>
        </el-col>
      </el-row>
      <!-- 网站公告 -->
      <el-row :gutter="5">
        <el-col :span="8">
          <el-form-item label="网站公告">
            <el-input
              type="textarea"
              rows="4"
              size="small"
              style="margin-top: 5px"
            ></el-input>
          </el-form-item>
        </el-col>
      </el-row>
      <!-- 座右铭 -->
      <el-row :gutter="5">
        <el-col :span="8">
          <el-form-item label="座右铭">
            <el-input
              type="textarea"
              rows="4"
              size="small"
              style="margin-top: 10px"
            ></el-input>
          </el-form-item>
        </el-col>
      </el-row>
      <!-- 备案号 -->
      <el-row :gutter="5">
        <el-col :span="8">
          <el-form-item label="备案号">
            <el-input size="small"></el-input>
          </el-form-item>
        </el-col>
      </el-row>
      <el-form-item>
        <div class="button-container">
          <el-button type="primary"> 修改 </el-button>
        </div>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
export default {
  name: "Webset",

  data() {
    return {};
  },

  mounted() {},

  methods: {},
};
</script>

<style lang="scss" scoped>
.item-title {
  font-size: 15px;
  font-weight: 500;
}
.el-row {
  margin-bottom: 10px;
}
.el-form-item {
  margin-bottom: 10px;
}
</style>
