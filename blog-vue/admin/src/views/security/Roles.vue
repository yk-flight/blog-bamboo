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
                v-if="userRole == 'ROLE_admin'"
                >编辑角色
              </el-button>
              <el-button
                @click="handleUpdate(scope.row)"
                type="text"
                size="small"
                v-if="scope.row.roleName != 'admin' && userRole == 'ROLE_admin'"
                >分配权限
              </el-button>
              <el-button
                type="text"
                size="small"
                v-if="scope.row.roleName != 'admin' && userRole == 'ROLE_admin'"
                @click="handleDelete(scope.row)"
                >删除角色
              </el-button>
            </template>
          </el-table-column>
        </el-table>
      </div>
    </el-card>

    <el-dialog
      :title="dialogTitle"
      width="500px"
      :visible="dialogShow"
      :before-close="handleClose"
    >
      <el-form>
        <el-form-item label="角色名称" label-width="80px">
          <el-input
            placeholder="请输入角色名称"
            v-model="role.roleNameZh"
          ></el-input>
        </el-form-item>
        <el-form-item label="权限字符" label-width="80px">
          <el-input v-model="role.roleName" placeholder="请输入权限字符">
            <template slot="prepend">ROLE_</template>
          </el-input>
        </el-form-item>
        <el-form-item label="创建时间" label-width="80px">
          <el-input
            placeholder="当前分类的创建时间"
            :value="dateFormat(role.createTime)"
            disabled
          ></el-input>
        </el-form-item>
        <el-form-item label="更新时间" label-width="80px">
          <el-input
            placeholder="当前分类的更新时间"
            :value="dateFormat(role.updateTime)"
            disabled
          ></el-input>
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
import dayjs from "dayjs";
import {
  getAllRoles,
  insertRole,
  updateRole,
  deleteRole,
} from "@/api/security";

export default {
  name: "Roles",

  data() {
    return {
      // 当前登录的角色
      userRole: this.$store.getters.userInfo.roles[0].roleName,
      // 角色数据
      roleList: [],
      // 对话框是否显示
      dialogShow: false,
      // 对话框标题
      dialogTitle: "",
      // 单个角色数据
      role: {
        id: undefined,
        roleName: "",
        roleNameZh: "",
        createTime: "",
        updateTime: "",
      },
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
      this.dialogTitle = "新增角色";
      this.role.createTime = this.dateFormat(new Date());
      this.role.updateTime = this.dateFormat(new Date());
      this.dialogShow = true;
    },
    handleDelete(row) {
      console.log(row);
      this.$confirm("确定删除 " + row.roleNameZh + " 吗？", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      })
        .then(() => {
          // 执行删除操作
          deleteRole(row.id).then(() => {
            // 重新获取表格数据
            this.getTableData();
          });
        })
        .catch(() => {});
    },
    handleUpdate(row) {
      this.dialogTitle = "更新角色";
      this.role = row;
      this.dialogShow = true;
    },
    // 关闭对话框
    handleClose() {
      this.dialogShow = false;
      this.reset();
    },
    // 点击提交按钮
    submitForm() {
      this.dialogShow = false;
      this.role.roleName = "ROLE_" + this.role.roleName;
      // 如果存在ID则说明为更新操作
      if (this.role.id) {
        updateRole(this.role).then(() => {
          this.getTableData();
        });
      } else {
        // 不存在ID则说明为新增操作
        insertRole(this.role).then(() => {
          this.getTableData();
        });
      }
    },

    // 刷新表单数据
    reset() {
      // 修改表单标题
      this.dialogTitle = "";
      // 重置表单对象
      this.role = {};
    },

    // 格式化时间
    dateFormat(date) {
      // 使用 dayjs 处理时间
      return dayjs(date).format("YYYY-MM-DD HH:mm:ss");
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
