<template>
  <div class="articleList-container">
    <div class="articleList-header">
      <el-form :inline="true">
        <el-form-item>
          <span class="title-label">文章名称</span>
          <el-input
            v-model="title"
            size="small"
            placeholder="请输入文章名称"
            style="width: 300px"
          ></el-input>
        </el-form-item>
        <el-form-item style="margin-left: 25px">
          <span class="title-label">文章类型</span>
          <el-select v-model="type" placeholder="请选择文章分类" size="small">
            <el-option
              v-for="item in typeList"
              :key="item.code"
              :label="item.description"
              :value="item.code"
            >
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item style="margin-left: 25px">
          <span class="title-label">文章分类</span>
          <el-select
            v-model="category"
            placeholder="请选择文章分类"
            size="small"
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
          写文章
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
        <el-button
          type="info"
          plain
          icon="el-icon-upload2"
          size="mini"
          disabled
        >
          导入
        </el-button>
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          disabled
        >
          导出
        </el-button>
      </div>
    </div>

    <div class="articleList-body">
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
        <el-table-column
          type="selection"
          width="50"
          align="center"
          :reserve-selection="true"
        >
        </el-table-column>
        <el-table-column prop="title" label="文章名称" align="center">
        </el-table-column>
        <el-table-column label="文章类型" align="center" width="90">
          <template slot-scope="scope">
            <el-tag v-if="scope.row.type == 1"> 原创 </el-tag>
            <el-tag v-else-if="scope.row.type == 2" type="success">
              转载
            </el-tag>
            <el-tag v-else type="info">翻译</el-tag>
          </template>
        </el-table-column>
        <el-table-column label="文章封面" align="center" width="150">
          <template slot-scope="scope">
            <el-image
              :src="scope.row.background"
              @click="preViewImage(scope.row.background)"
              :preview-src-list="srcList"
            ></el-image>
          </template>
        </el-table-column>
        <el-table-column label="发布状态" align="center" width="90">
          <template slot-scope="scope">
            <el-tag v-if="scope.row.state == 1"> 已发布 </el-tag>
            <el-tag v-else-if="scope.row.state == 0" type="warning">
              草稿
            </el-tag>
            <el-tag v-else type="danger">回收站</el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="categoryName" label="文章分类" align="center">
        </el-table-column>
        <el-table-column label="文章标签" align="center">
          <template slot-scope="scope">
            <el-tag
              v-for="item in scope.row.tags"
              :key="item"
              style="margin-right: 8px; margin-top: 8px"
            >
              {{ item }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column label="置顶" align="center" width="70">
          <template slot-scope="scope">
            <el-switch
              v-model="scope.row.top"
              @change="handleTopChange(scope.row)"
            >
            </el-switch>
          </template>
        </el-table-column>
        <el-table-column label="评论" align="center" width="70">
          <template slot-scope="scope">
            <el-switch
              v-model="scope.row.allowComment"
              @change="handleCommentChange(scope.row)"
            >
            </el-switch>
          </template>
        </el-table-column>
        <el-table-column
          label="访问量"
          align="center"
          width="80"
          prop="viewNum"
        >
        </el-table-column>
        <el-table-column
          label="评论量"
          align="center"
          width="80"
          prop="commentNum"
        >
        </el-table-column>
        <el-table-column label="发布时间" align="center">
          <template slot-scope="scope">
            <span>{{ scope.row.publishTime | dateFilter }}</span>
          </template>
        </el-table-column>
        <el-table-column label="操作" align="center">
          <template slot-scope="scope">
            <!-- @click="handleClick(scope.row)" -->
            <el-button type="text" icon="el-icon-edit-outline">
              编辑
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

    <div class="articleList-footer">
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
  </div>
</template>

<script>
import {
  getAllCategory,
  getArticleList,
  updateArticleTop,
  updateArticleComment,
  removeArticle,
  deleteArticleBatchIds,
} from "@/api/article";

export default {
  name: "Articles",

  data() {
    return {
      tableData: [],
      // 当前页数
      curPage: 1,
      // 页面大小
      size: 10,
      // 数据总数
      total: 0,
      // 文章名称
      title: "",
      // 文章类型参数
      type: undefined,
      // 文章分类参数
      category: undefined,
      // 发布状态
      state: undefined,
      // 是否回收
      deleted: false,
      // 文章类型集合
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
      // 文章状态集合
      stateList: [
        {
          value: 0,
          description: "草稿",
        },
        {
          value: 1,
          description: "已发布",
        },
        {
          value: 2,
          description: "回收站",
        },
      ],
      // 文章分类集合
      categories: [],
      // 表格多选框
      multipleSelection: [],
      // 图片预览
      srcList: [],
    };
  },

  mounted() {
    // 获取表格数据
    this.getTableData();
    // 获取文章分类
    this.getArticleCategory();
  },

  methods: {
    // 获取表格数据
    getTableData() {
      getArticleList({
        curPage: this.curPage,
        size: this.size,
        title: this.title,
        type: this.type == undefined ? 0 : this.type,
        category: this.category == undefined ? 0 : this.category,
        state: this.state == undefined ? -1 : this.state,
        deleted: this.deleted,
      }).then((result) => {
        // 定义当前返回的表格集合
        this.tableData = result.list;
        // 数据总条数
        this.total = result.total;
      });
    },
    // 点击搜索按钮后的操作
    handleQuery() {
      this.getTableData();
    },
    // 点击了重置按钮后的操作
    resetQuery() {
      this.reset();
      // 获取数据
      this.getTableData();
    },
    // 重置文章查询参数
    reset() {
      // 文章名称
      this.title = "";
      // 文章类型参数
      this.type = undefined;
      // 文章分类参数
      this.category = undefined;
      // 发布状态
      this.state = undefined;
      // 是否回收
      this.deleted = false;
    },
    // 点击写文章的按钮
    handleAdd() {
      this.$router.push("/article/create-article");
    },
    // 点击批量删除的按钮
    handleDeleteBatch() {
      // 将选中的id进行存储
      const ids = [];
      this.multipleSelection.forEach((item) => {
        ids.push(item.id);
      });
      this.$confirm("确定要将这些文章移动到回收站吗？", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      })
        .then(() => {
          // 执行删除操作
          deleteArticleBatchIds(ids).then(() => {
            // 重新获取表格数据
            this.getTableData();
            // 清除当前多选框数据
            this.multipleSelection = [];
          });
        })
        .catch(() => {});
    },
    // 获取文章分类
    getArticleCategory() {
      getAllCategory().then((result) => {
        this.categories = result;
      });
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
    // 表格多选框点击事件
    handleSelectionChange(val) {
      this.multipleSelection = val; //存储选中的数据
    },
    // 点击删除按钮
    handleDelete(row) {
      this.$confirm("确定要将 " + row.title + " 移动到回收站吗？", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      })
        .then(() => {
          // 执行删除操作
          removeArticle(row.id).then(() => {
            // 重新获取数据
            this.getTableData();
          });
        })
        .catch(() => {});
    },
    // 修改文章置顶状态
    handleTopChange(row) {
      updateArticleTop(row.id).then(() => {
        // 刷新表格数据
        this.getTableData();
      });
    },
    // 修改文章评论状态
    handleCommentChange(row) {
      updateArticleComment(row.id).then(() => {
        // 刷新表格数据
        this.getTableData();
      });
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
.articleList-container {
  margin-top: 10px;
  .articleList-header {
    margin-top: 10px;
    padding-left: 15px;
    .title-label {
      font-size: 14px;
      font-weight: 700;
      color: #606266;
      margin-right: 12px;
    }
  }
  .articleList-body {
    margin-top: 20px;
    padding-left: 15px;
    padding-right: 15px;
  }
  .articleList-footer {
    padding-left: 15px;
    margin-top: 40px;
  }
}
</style>
