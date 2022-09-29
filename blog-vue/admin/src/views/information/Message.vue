<template>
  <div class="message-container">
    <el-card shadow="never">
      <div class="message-header">
        <el-form :inline="true">
          <el-form-item>
            <span class="title-label">用户昵称</span>
            <el-input
              size="small"
              v-model="nickName"
              placeholder="请输入用户昵称"
              style="width: 300px"
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
          <div class="left">
            <span class="span-label-title" style="margin-right: 20px">
              状态
            </span>
            <span
              @click="changeActive(-1)"
              :class="isAllow == -1 ? 'span-label-active' : 'span-label'"
            >
              全部
            </span>
            <span
              @click="changeActive(1)"
              :class="isAllow == 1 ? 'span-label-active' : 'span-label'"
            >
              已通过
            </span>
            <span
              @click="changeActive(0)"
              :class="isAllow == 0 ? 'span-label-active' : 'span-label'"
            >
              审核中
            </span>
          </div>
          <div class="right">
            <el-button
              type="success"
              plain
              icon="el-icon-circle-check"
              size="mini"
              @click="handlePassBatch"
            >
              批量通过
            </el-button>
            <el-button
              type="danger"
              plain
              icon="el-icon-delete"
              size="mini"
              @click="handleDeleteBatch"
            >
              批量删除
            </el-button>
          </div>
        </div>
      </div>

      <div class="message-body">
        <el-table
          :data="tableData"
          border
          :header-cell-style="{ background: '#f8f8f9', color: '#606266' }"
          @selection-change="handleSelectionChange"
          ref="table"
          row-key="id"
          style="width: 100%"
          size="medium"
        >
          <el-table-column type="selection" width="50" align="center">
          </el-table-column>
          <el-table-column prop="nickName" label="留言用户" align="center">
          </el-table-column>
          <el-table-column label="用户头像" align="center" width="100">
            <template>
              <el-empty
                v-if="!this.$store.getters.avatar"
                description="暂无图片"
                :image-size="40"
                style="height: 60px"
              ></el-empty>
              <el-image v-else :src="this.$store.getters.avatar"></el-image>
            </template>
          </el-table-column>
          <el-table-column
            prop="content"
            label="留言内容"
            align="center"
            width="400"
          >
          </el-table-column>
          <el-table-column prop="ipSource" label="IP地址" align="center">
          </el-table-column>
          <el-table-column prop="ipAddress" label="IP属地" align="center">
          </el-table-column>
          <el-table-column label="留言时间" align="center">
            <template slot-scope="scope">
              <span>{{ scope.row.messageTime | dateFilter }}</span>
            </template>
          </el-table-column>
          <el-table-column label="留言状态" align="center">
            <template slot-scope="scope">
              <el-tag v-if="scope.row.allow == 1">已通过</el-tag>
              <el-tag v-else type="warning">审核中</el-tag>
            </template>
          </el-table-column>
          <el-table-column label="操作" align="center">
            <template slot-scope="scope">
              <el-button
                v-if="isAllow == 0"
                type="text"
                @click="handlePass(scope.row)"
                icon="el-icon-circle-check"
              >
                通过
              </el-button>
              <el-button
                v-else
                type="text"
                @click="handleDelete(scope.row)"
                icon="el-icon-delete"
              >
                删除
              </el-button>
            </template>
          </el-table-column>
        </el-table>
      </div>

      <div class="message-footer">
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
  </div>
</template>

<script>
import {
  getMessageList,
  deleteMessageById,
  deleteMessageBatchIds,
  passMessageById,
  passMessageBatchIds,
} from "@/api/message.js";

export default {
  name: "Message",

  data() {
    return {
      // 用户昵称
      nickName: "",
      // 是否通过
      isAllow: -1,
      // 标签列表
      tableData: [],
      // 当前页数
      curPage: 1,
      // 页面大小
      size: 10,
      // 数据总条数
      total: 0,
      // 表格多选框
      multipleSelection: [],
    };
  },

  mounted() {
    this.getTableData();
  },
  watch: {
    isAllow() {
      // 重新定义当前页数
      this.curPage = 1;
      // 获取表格数据
      this.getTableData();
    },
  },
  methods: {
    // 获取表格数据
    getTableData() {
      getMessageList({
        curPage: this.curPage,
        size: this.size,
        nickName: this.nickName,
        allow: this.isAllow,
      }).then((result) => {
        this.tableData = result.list;
        this.total = result.total;
      });
    },
    // 更换查询状态
    changeActive(val) {
      this.isAllow = val;
    },
    // 点击查询事件
    handleQuery() {
      this.getTableData();
    },
    // 点击重置操作
    resetQuery() {
      // 清空用户昵称
      this.nickName = "";
      this.getTableData();
    },
    handleDeleteBatch() {},
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
    // 点击批量删除数据
    handleDeleteBatch() {
      // 将选中的id进行存储
      const ids = [];
      this.multipleSelection.forEach((item) => {
        ids.push(item.id);
      });
      this.$confirm("确定删除这些留言吗？", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      })
        .then(() => {
          // 执行删除操作
          deleteMessageBatchIds(ids).then(() => {
            // 重新获取表格数据
            this.getTableData();
            // 清空表格多选框
            this.multipleSelection = [];
          });
        })
        .catch(() => {});
    },
    // 点击删除按钮
    handleDelete(row) {
      this.$confirm("确定删除这条留言吗？", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      })
        .then(() => {
          // 执行删除操作
          deleteMessageById(row.id).then(() => {
            // 刷新表格数据
            this.getTableData();
          });
        })
        .catch(() => {});
    },
    // 点击通过按钮
    handlePass(row) {
      this.$confirm("确定通过这条留言吗？", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "success",
      })
        .then(() => {
          // 执行通过操作
          passMessageById(row.id).then(() => {
            // 刷新表格数据
            this.getTableData();
          });
        })
        .catch(() => {});
    },
    // 点击批量通过按钮
    handlePassBatch() {
      // 将选中的id进行存储
      const ids = [];
      this.multipleSelection.forEach((item) => {
        ids.push(item.id);
      });
      this.$confirm("确定通过这些留言吗？", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "success",
      })
        .then(() => {
          // 执行通过操作
          passMessageBatchIds(ids).then(() => {
            // 刷新表格数据
            this.getTableData();
            console.log(this.multipleSelection);
            // 清空表格多选框
            this.multipleSelection = [];
            console.log(this.multipleSelection);
          });
        })
        .catch(() => {});
    },
    // 多选框按钮
    handleSelectionChange(val) {
      this.multipleSelection = val; //存储选中的数据
    },
  },
};
</script>

<style lang="scss" scoped>
.message-container {
  margin-top: 10px;
  .message-header {
    margin-top: 10px;
    padding-left: 15px;
    .title-label {
      font-size: 14px;
      font-weight: 700;
      color: #606266;
      margin-right: 12px;
    }
    .button-container {
      display: flex;
      align-items: center;
      justify-content: space-between;
      margin-right: 15px;
    }
    .span-label {
      cursor: pointer;
      font-size: 14px;
      font-weight: 600;
      color: #909399;
      margin-right: 20px;
    }
    .span-label-title {
      font-size: 14px;
      font-weight: 600;
      color: #909399;
      margin-right: 20px;
    }
    .span-label-active {
      cursor: pointer;
      font-size: 14px;
      font-weight: 600;
      color: #303133;
      margin-right: 20px;
    }
  }
  .message-body {
    margin-top: 20px;
    padding-left: 15px;
    padding-right: 15px;
  }
  .message-footer {
    padding-left: 15px;
    margin-top: 40px;
  }
}
</style>
