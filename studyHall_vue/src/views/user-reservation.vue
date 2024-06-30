<template>
    <div>
    <div class="flex flex-wrap gap-4 items-center">
      <el-select v-model="value" placeholder="筛选自习室类型" style="width: 240px" @change="getUsableResponseData">
    <el-option
      v-for="item in options"
      :key="item.value"
      :label="item.label"
      :value="item.value"
    />
  </el-select>
    </div>
  
    <el-table
      :data="tableData"
      style="width: 100%"
      size="large"
      max-height="700px"
      fit="true"
    >
    <el-table-column fixed prop="id" label="ID" width="150" />
    <el-table-column fixed prop="location" label="教室" width="150" />
      <el-table-column fixed prop="status" label="状态" width="150"/>
      <el-table-column fixed prop="facilities" label="设备" width="150" />
      <el-table-column fixed="right" label="操作" width="120">
        <template #default="scope">
          <el-button link type="primary" size="small" @click="openDialog(scope.row)">
            预约
          </el-button>
        </template>
      </el-table-column>
    </el-table>

    <el-dialog
    :title="'申请'"
    v-model="visible"
    width="700px"
    destroy-on-close
    :close-on-click-modal="false"
    @close="closeDialog"
  >
    <TableEdit
      :form-data="rowData"
      :options="option"
      :edit="isEdit"
      :update="reservation"
    />
  </el-dialog>
</div>
  </template>
  
  <script lang="ts" setup>
  import axios from "axios";
  import { onMounted, ref } from "vue";
  import { UsableRoom } from "../types/usable";
  import { ElMessage } from "element-plus";
  import { FormOption } from "../types/form-option";

  
  // 新增/编辑弹窗相关
const option = ref<FormOption>({
  labelWidth: "100px",
  span: 24,
  list: [
    { type: "input", label: "申请原因", prop: "type", required: true },
  ],
});

const visible = ref(false);
const isEdit = ref(false);
const rowData = ref({});

const closeDialog = () => {
  visible.value = false;
  isEdit.value = false;
  rowData.value = {};
};

const openDialog = (row: any) => {
  visible.value = true;
  isEdit.value = true;
  rowData.value = { ...row };
};

  
  const value = ref<string | null>(null);
  const options = ref<{ value: string; label: string }[]>([]);
  const tableData = ref<UsableRoom[]>([]);
  
  const token = localStorage.getItem("token"); // 替换为实际的 Token 值
  const headers = { token: `${token}` };
  
  // 获取 option 中的数据
  const getResponseData = async () => {
    const response = await axios.get("http://localhost:8989/study-rooms/getStudyRoomOnlyType", {
      headers,
    });
  
    console.log(response.data.data);
  
    // 更新 options 数组
    options.value = response.data.data.map((item) => ({
      value: item.type,
      label: item.type,
    }));
  };
  
  // 获取可用的自习室
  const getUsableResponseData = async () => {
    const response = await axios.get(
      `http://localhost:8989/reservations/getReservationUsable?options=${value.value}`,
      {
        headers,
      }
    );
    tableData.value = response.data.data;
  };
  
  // 预约自习室
  const reservation = async (row: any) => {
    console.log(row.type+"=========");
    
    const response = await axios.post(
      `http://localhost:8989/reservations`,
      {
        studyDetailsId: row.id,
        reason: row.type,
      },
      {
        headers,
      }
    );
    if (response.data.code === 200) {
      ElMessage.success(response.data.msg);
    } else {
      ElMessage.error(response.data.msg);
    }
  };
  
  onMounted(async () => {
    try {
      await getResponseData();
      await getUsableResponseData();
    } catch (error) {
      console.error("Error:", error);
    }
  });
  
  </script>@/types/usable