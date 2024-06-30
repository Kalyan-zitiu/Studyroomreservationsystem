<template>
  <div>
  <div class="flex flex-wrap gap-4 items-center">
    <el-select v-model="value" placeholder="筛选自习室类型" style="width: 240px" @change="getCheckResponseData">
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
  <el-table-column fixed prop="reservationId" label="序号" width="150" />
    <el-table-column fixed prop="location" label="教室" width="150" />
    <el-table-column fixed prop="type" label="自习室类型" width="150" />
    <el-table-column prop="userName" label="用户" width="120" />
    <el-table-column prop="reason" label="用处" width="120" />
    <el-table-column prop="dateTime" label="时间" width="120" />
    <el-table-column prop="facilities" label="设施" width="120" />
    <el-table-column prop="status" label="状态" width="120" />
    <el-table-column fixed="right" label="操作" width="120">
      <template #default="scope">
        <el-button link type="primary" size="small" @click="setPass(scope.row)" v-if="scope.row.status == '已通过'">
          不通过
        </el-button>
        <el-button link type="primary" size="small" @click="setNoPass(scope.row)" v-else>
          通过
        </el-button>
      </template>
    </el-table-column>
  </el-table>
</div>
</template>

<script lang="ts" setup>
import axios from "axios";
import { onMounted, ref } from "vue";
import { ReservationDTO } from "@/types/reservation";
import { ElMessage } from "element-plus";

const value = ref<string | null>(null);
const options = ref<{ value: string; label: string }[]>([]);
const tableData = ref<ReservationDTO[]>([]);

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

// 获取审核的数据
const getCheckResponseData = async () => {
  const response = await axios.get(
    `http://localhost:8989/reservations/getReservation?options=${value.value}`,
    {
      headers,
    }
  );
  tableData.value = response.data.data;
};

// 审核通过的
const setPass = async (row: any) => {
  const response = await axios.put(
    `http://localhost:8989/reservations`,
    {
      reservationId: row.reservationId,
      reservationStatus: 0,
    },
    {
      headers,
    }
  );
  if (response.data.code === 200) {
    ElMessage.success(response.data.msg);
    getCheckResponseData()
  } else {
    ElMessage.error(response.data.msg);
  }
};

// 审核不通过的
const setNoPass = async (row: any) => {
  const response = await axios.put(
    `http://localhost:8989/reservations`,
    {
      reservationId: row.reservationId,
      reservationStatus: 2,
    },
    {
      headers,
    }
  );
  if (response.data.code === 200) {
    ElMessage.success(response.data.msg);
    getCheckResponseData()
  } else {
    ElMessage.error(response.data.msg);
  }
};
onMounted(async () => {
  try {
    await getResponseData();
    await getCheckResponseData();
  } catch (error) {
    console.error("Error:", error);
  }
});

</script>