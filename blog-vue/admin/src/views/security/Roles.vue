<template>
  <div class="role-container">
    <el-card shadow="never">
      <div class="role-header">
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
        </div>
      </div>

      <div class="role-body">
        <el-table
          :data="roleList"
          :header-cell-style="{ background: '#f8f8f9', color: '#606266' }"
          ref="table"
          row-key="id"
          style="width: 100%"
          size="medium"
        >
          <el-table-column label="序号" width="60" align="center">
            <template slot-scope="scope">
              {{ scope.$index + 1 }}
            </template>
          </el-table-column>
          <el-table-column prop="roleNameZh" label="角色名称" align="center">
          </el-table-column>
          <el-table-column prop="roleName" label="权限字符" align="center">
          </el-table-column>
          <el-table-column label="创建时间" align="center">
            <template slot-scope="scope">
              <span>{{ scope.row.createTime | dateFilter }}</span>
            </template>
          </el-table-column>
          <el-table-column label="上一次更新时间" align="center">
            <template slot-scope="scope">
              <span>{{ scope.row.updateTime | dateFilter }}</span>
            </template>
          </el-table-column>
          <el-table-column label="操作" align="center">
            <template slot-scope="scope">
              <el-button
                @click="handleUpdate(scope.row)"
                type="text"
                size="small"
                >编辑角色
              </el-button>
              <el-button
                @click="handleUpdate(scope.row)"
                type="text"
                size="small"
                v-if="scope.row.id != 1"
                >分配权限
              </el-button>
              <el-button
                type="text"
                size="small"
                v-if="scope.row.id != 1"
                @click="handleDelete(scope.row.id)"
                >删除角色
              </el-button>
            </template>
          </el-table-column>
        </el-table>
      </div>
    </el-card>
  </div>
</template>

<script>
import { getAllRoles } from "@/api/security";

export default {
  name: "Roles",

  data() {
    return {
      // 角色数据
      roleList: [],
    };
  },

  mounted() {
    this.getTableData();
  },

  methods: {
    // 获取表格数据
    getTableData() {
      getAllRoles().then((result) => {
        this.roleList = result;
      });
    },

    // 点击添加按钮
    handleAdd() {
      console.log("点击了添加按钮");
    },
    handleDelete() {
      console.log("点击了删除按钮");
    },
    handleUpdate() {
      console.log("点击了编辑按钮");
    },
  },
};
</script>

<style lang="scss" scoped>
.role-container {
  margin-top: 10px;

  .role-header {
    margin-top: 10px;
    padding-left: 15px;
  }

  .role-body {
    margin: 20px 15px 30px 15px;
  }
}
</style>
