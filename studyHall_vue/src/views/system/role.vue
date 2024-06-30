<template>
    <div>
        <TableSearch :query="query" :options="searchOpt" :search="handleSearch" />
        <div class="container">

            <TableCustom :columns="columns" :tableData="tableData" :total="page.total" :viewFunc="handleView"
                :delFunc="handleDelete" :page-change="changePage" :editFunc="handleEdit">
                <template #toolbarBtn>
                    <el-button type="warning" :icon="CirclePlusFilled" @click="handleAddButtonClick">新增</el-button>
                </template>
                <template #status="{ rows }">
                    <el-tag type="success" v-if="rows.status">启用</el-tag>
                    <el-tag type="danger" v-else>禁用</el-tag>
                </template>
                <template #permissions="{ rows }">
                    <el-button type="primary" size="small" plain @click="handlePermission(rows)">管理</el-button>
                </template>
            </TableCustom>
        </div>
        <el-dialog :title="isEdit ? '编辑' : '新增'" v-model="visible" width="700px" destroy-on-close
            :close-on-click-modal="false" @close="closeDialog">
            <TableEdit :form-data="rowData" :options="options" :edit="isEdit" :update="updateData" />
        </el-dialog>
        <el-dialog title="查看详情" v-model="visible1" width="700px" destroy-on-close>
            <TableDetail :data="viewData">
                <template #status="{ rows }">
                    <el-tag type="success" v-if="rows.status">启用</el-tag>
                    <el-tag type="danger" v-else>禁用</el-tag>
                </template>
            </TableDetail>
        </el-dialog>
        <el-dialog title="权限管理" v-model="visible2" width="500px" destroy-on-close>
            <RolePermission :permiss-options="permissOptions" />
        </el-dialog>
    </div>
</template>

<script setup lang="ts" name="system-role">
import { ref, reactive } from 'vue';
import { ElMessage } from 'element-plus';
import { Role } from '@/types/role';
import { fetchRoleData } from '@/api';
import TableCustom from '@/components/table-custom.vue';
import TableDetail from '@/components/table-detail.vue';
import RolePermission from './role-permission.vue'
import { CirclePlusFilled } from '@element-plus/icons-vue';
import { FormOption, FormOptionList } from '@/types/form-option';
import axios from 'axios';
import { ro } from 'element-plus/es/locale';

// 查询相关
const query = reactive({
    roleName: '',
});
const searchOpt = ref<FormOptionList[]>([
    { type: 'input', label: '角色名称：', prop: 'roleName' }
])
const handleSearch = () => {
    changePage(1);
};

// 表格相关
let columns = ref([
    { type: 'index', label: '序号', width: 55, align: 'center' },
    { prop: 'roleName', label: '角色名称' },
    { prop: 'roleSign', label: '角色标识' },
    { prop: 'status', label: '状态' },
    { prop: 'permissions', label: '权限管理' },
    { prop: 'operator', label: '操作', width: 250 },
])
const page = reactive({
    index: 1,
    size: 10,
    total: 0,
})
const tableData = ref<Role[]>([]);
const headers = {token: `${localStorage.getItem("token")}`}
const getData = async () => {
    // const res = await fetchRoleData()
    // 从数据库中获取
    const responseData = await axios.get(`http://localhost:8989/roles/getRoleAll?key=${query.roleName}`,{headers});
    tableData.value = responseData.data.data;
    // page.total = responseData.data.pageTotal;
};
getData();

const changePage = (val: number) => {
    page.index = val;
    getData();
};

// 新增/编辑弹窗相关
const options = ref<FormOption>({
    labelWidth: '100px',
    span: 24,
    list: [
        { type: 'input', label: '角色名称', prop: 'roleName', required: true },
        { type: 'input', label: '角色标识', prop: 'roleSign', required: true },
        { type: 'switch', label: '状态', prop: 'status', required: false, activeText: '启用', inactiveText: '禁用' },
    ]
})
const visible = ref(false);
const isEdit = ref(false);
const rowData = ref({});

const handleAddButtonClick = (row: Role) => {
  // 执行你想要的操作
  visible.value = true;
  isEdit.value = false;
};

const handleEdit = (row: Role) => {
    rowData.value = { ...row };
    isEdit.value = true;
    visible.value = true;
};
const closeDialog = () => {
    visible.value = false;
    isEdit.value = false;
    rowData.value = {};
};

// 查看详情弹窗相关
const visible1 = ref(false);
const viewData = ref({
    row: {},
    list: [],
    column: 1
});
const handleView = (row: Role) => {
    viewData.value.row = { ...row }
    viewData.value.list = [
        {
            prop: 'roleId',
            label: '角色ID',
        },
        {
            prop: 'roleName',
            label: '角色名称',
        },
        {
            prop: 'roleSign',
            label: '角色标识',
        },
        {
            prop: 'status',
            label: '角色状态',
        },
    ]
    visible1.value = true;
};

// 删除相关
const handleDelete = async (row: Role) => {
    const responseData = await axios.delete(`http://localhost:8989/roles/${row.roleId}`,{headers});
    if(responseData.data.code === 500){
        ElMessage.error(responseData.data.msg);
    }else{
        ElMessage.success(responseData.data.msg);
    }
}

//修改数据
const updateData = async (role: Role) => {
  // 判断是编辑还是新增
  // 1.编辑
  if (isEdit.value) {
    try {
      const response = await axios.put(
        `http://localhost:8989/roles/updateRole`,
        {
          status: role.status,
          roleId: role.roleId,
          roleName: role.roleName,
          roleSign: role.roleSign
        },
        { headers }
      );
      if (response.data.code === 200) {
        // 显示成功消息
        ElMessage.success(response.data.msg);
      } else {
        // 显示失败消息
        ElMessage.error(response.data.msg);
      }
    } catch (error) {
      // 显示失败消息
      console.error(error);
    }
  }
  //新增
  else {
    try {
      const response = await axios.post(
        `http://localhost:8989/roles`,
        {
          status: role.status,
          roleName: role.roleName,
          roleSign: role.roleSign
        },
        { headers }
      );
      if (response.data.code === 200) {
        // 显示成功消息
        ElMessage.success(response.data.msg);
      } else {
        // 显示失败消息
        ElMessage.error(response.data.msg);
      }
    } catch (error) {
      // 显示失败消息
      console.error(error);
    }
  }
  closeDialog();
  getData();
};


// 权限管理弹窗相关
const visible2 = ref(false);
const permissOptions = ref({})
const handlePermission = (row: Role) => {
    visible2.value = true;
    permissOptions.value = {
        roleId: row.roleId,
        permiss: row.permiss
    };
}
</script>

<style scoped></style>