<template>
  <div>
  <el-table :data="tableData" style="width: 100%" size="large" max-height="700px" fit="true">
    <el-table-column fixed prop="location" label="教室" width="150" />
    <el-table-column prop="reservationFrequency" label="预约次数" width="120" />
    <el-table-column prop="usageFrequency" label="使用次数" width="120" />
    <el-table-column prop="usagePercent" label="使用率" width="120" />
  </el-table>
</div>
</template>

<script setup lang="ts">
import axios from 'axios';
import { ref } from 'vue';

const tableData = ref([]);

const fetchData = async () => {
  try {
    const token = localStorage.getItem('token'); // 替换为实际的 Token 值
    const headers = { token: `${token}` };
    const response = await axios.get('http://localhost:8989/study-room-details/getTable', { headers });
    tableData.value = response.data.data;
    console.log(tableData.value)

  } catch (error) {
    console.error(error);
  }
};

fetchData(); // 在 setup 部分调用 fetchData 函数

</script>