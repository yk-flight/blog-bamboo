<template>
  <div class="links-container">
    <el-card shadow="never">
      <div class="links-header">
        <el-form :inline="true">
          <el-form-item>
            <span class="title-label">网站名称</span>
            <el-input
              v-model="title"
              placeholder="请输入网站名称"
              style="width: 300px"
              size="small"
            ></el-input>
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
          <el-button
            type="primary"
            plain
            icon="el-icon-plus"
            size="mini"
            @click="handleAdd"
          >
            新增
          </el-button>
          <el-button
            type="info"
            plain
            icon="el-icon-upload2"
            size="mini"
            disabled
          >
            导入
          </el-button>
          <el-button type="warning" plain icon="el-icon-download" size="mini">
            导出
          </el-button>
        </div>
      </div>

      <div class="links-body">
        <el-table
          :header-cell-style="{ background: '#f8f8f9', color: '#606266' }"
          ref="table"
          row-key="id"
          :data="linksList"
          border
        >
          <el-table-column label="序号" width="50" align="center">
            <template slot-scope="scope">
              {{ scope.$index + 1 }}
            </template>
          </el-table-column>
          <el-table-column prop="title" label="网站名称" align="center">
          </el-table-column>
          <el-table-column label="网站图标" align="center" width="100">
            <template slot-scope="scope">
              <el-image
                :src="scope.row.logo"
                @click="preViewImage(scope.row.logo)"
                :preview-src-list="srcList"
              ></el-image>
            </template>
          </el-table-column>
          <el-table-column prop="website" label="网站地址" align="center">
          </el-table-column>
          <el-table-column prop="description" label="网站描述" align="center">
          </el-table-column>
          <el-table-column label="创建时间" align="center">
            <template slot-scope="scope">
              <i class="el-icon-time"></i>
              <span style="margin-left: 10px">
                {{ scope.row.createTime | dateFilter }}
              </span>
            </template>
          </el-table-column>
          <el-table-column label="操作" align="center">
            <template slot-scope="scope">
              <el-button
                type="text"
                icon="el-icon-edit"
                @click="handleUpdate(scope.row)"
              >
                修改
              </el-button>
              <el-button
                type="text"
                icon="el-icon-delete"
                @click="handleDelete(scope.row)"
              >
                删除
              </el-button>
            </template>
          </el-table-column>
        </el-table>
      </div>

      <div class="links-footer">
        <el-pagination
          :page-sizes="[10, 20, 50, 100]"
          :page-size="10"
          layout="total, sizes, prev, pager, next, jumper"
          :total="total"
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
        >
        </el-pagination>
      </div>
    </el-card>

    <!--  友链添加 / 更新对话框  -->
    <el-dialog
      :title="dialogTitle"
      width="500px"
      :visible="dialogShow"
      :before-close="handleClose"
    >
      <el-form :model="links" label-width="80px">
        <el-form-item label="网站名称">
          <el-input
            v-model="links.title"
            placeholder="请输入网站名称"
            size="small"
          ></el-input>
        </el-form-item>
        <el-form-item label="网站地址">
          <el-input
            v-model="links.website"
            placeholder="请输入网地址"
            size="small"
          ></el-input>
        </el-form-item>
        <el-form-item label="网站图标">
          <el-input
            v-model="links.logo"
            placeholder="请输入网站图标地址"
            size="small"
            type="textarea"
            style="margin-bottom: 10px; margin-top: 5px"
          ></el-input>
        </el-form-item>
        <el-form-item label="网站描述">
          <el-input
            v-model="links.description"
            placeholder="请输入网站描述"
            size="small"
            type="textarea"
          >
          </el-input>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确定</el-button>
        <el-button @click="handleClose">取消</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
import {
  getLinksList,
  updateLinks,
  addLinks,
  deleteLinkById,
} from "@/api/links";
import dayjs from "dayjs";

export default {
  name: "Links",

  data() {
    return {
      // 网站名称
      title: "",
      // 当前页数
      curPage: 1,
      // 页面大小
      size: 10,
      // 友链数据
      linksList: [],
      // 数据条数
      total: 0,
      // 对话框是否显示
      dialogShow: false,
      // 对话框标题
      dialogTitle: "",
      // 友链对象
      links: {
        // 主键
        id: undefined,
        // 网站名称
        title: "",
        // 网站地址
        website: "",
        // 网站图标
        logo: "",
        // 网站描述
        description: "",
        // 创建时间
        createTime: "",
      },
      // 图片预览
      srcList: [],
    };
  },

  mounted() {
    this.getTableData();
  },

  methods: {
    // 获取表格数据
    getTableData() {
      getLinksList({
        curPage: this.curPage,
        size: this.size,
        title: this.title,
      }).then((result) => {
        this.linksList = result.list;
        this.total = result.total;
      });
    },
    // 点击了查询按钮
    handleQuery() {
      this.getTableData();
    },
    // 点击了重置按钮
    resetQuery() {
      this.reset();
      // 重新获取数据
      this.getTableData();
    },
    // 关闭对话框
    handleClose() {
      this.dialogShow = false;
      this.reset();
    },
    // 刷新表单数据
    reset() {
      // 修改表单标题
      this.title = "";
      // 修改对话框标题
      this.dialogTitle = "";
      // 重置友链对象
      this.links = {
        // 主键
        id: undefined,
        // 网站名称
        title: "",
        // 网站地址
        website: "",
        // 网站图标
        logo: "",
        // 网站描述
        description: "",
        // 创建时间
        createTime: "",
      };
    },
    // 当页面大小发生变化时
    handleSizeChange(val) {
      this.size = val;
      // 重新获取数据
      this.getTableData();
    },

    // 当前页发生变化时
    handleCurrentChange(val) {
      this.curPage = val;
      // 重新获取数据
      this.getTableData();
    },
    // 点击修改事件
    handleUpdate(row) {
      this.dialogTitle = "更新友链";
      this.links = row;
      this.dialogShow = true;
    },
    // 点击新增事件
    handleAdd() {
      this.dialogTitle = "添加友链";
      this.dialogShow = true;
    },
    // 点击确认修改/添加事件
    submitForm() {
      // 如果存在ID则说明为更新操作
      if (this.links.id) {
        // 更新操作
        updateLinks(this.links).then(() => {
          // 重新获取表格数据
          this.getTableData();
        });
      } else {
        // 处理创建时间
        this.links.createTime = new Date();
        // 新增操作
        addLinks(this.links).then(() => {
          // 重新获取表格数据
          this.getTableData();
        });
      }
      this.handleClose();
    },
    // 点击删除按钮
    handleDelete(row) {
      this.$confirm("确定删除 " + row.title + " 吗？", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      })
        .then(() => {
          // 执行删除操作
          deleteLinkById(row.id).then(() => {
            // 重新获取表格数据
            this.getTableData();
          });
        })
        .catch(() => {});
    },
    // 格式化时间
    dateFormat(date) {
      // 使用 dayjs 处理时间
      return dayjs(date).format("YYYY-MM-DD HH:mm:ss");
    },
    // 图片预览
    preViewImage(val) {
      this.srcList = [];
      this.srcList.push(val);
    },
  },
};
</script>

<style lang="scss" scoped>
.links-container {
  margin-top: 10px;
  .links-header {
    margin-top: 10px;
    padding-left: 15px;
    .title-label {
      font-size: 14px;
      font-weight: 700;
      color: #606266;
      margin-right: 12px;
    }
  }
  .links-body {
    margin: 20px 15px 30px 15px;
  }
  .links-footer {
    padding-left: 15px;
    margin-top: 40px;
  }
  .el-form-item {
    margin-bottom: 10px;
  }
}
</style>
