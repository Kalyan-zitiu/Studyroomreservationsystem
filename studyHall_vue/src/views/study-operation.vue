<template>
  <div>

          <el-button
            type="warning"
            @click="openDialogAdd"
            >新增自习室</el-button
          >

  <el-table
    :data="tableData"
    style="width: 100%"
    size="large"
    max-height="700px"
    fit="true"
  >
  <el-table-column prop="studyRoomId" label="自习室 ID" width="120" />
    <el-table-column fixed prop="type" label="类型" width="150" />
    <el-table-column prop="capacity" label="容量" width="120" />
    <el-table-column prop="studyRoomNumber" label="剩余容量" width="120" />
    <el-table-column prop="facilities" label="设备" width="120" />
    <el-table-column fixed="right" label="操作" width="120">
      <template #default="scope">
        <el-button
          link
          type="primary"
          size="small"
          @click="openDialog(scope.row)"
        >
          修改
        </el-button>
        <el-button link type="primary" size="small" @click="deleteRoom">删除</el-button>
      </template>
    </el-table-column>
  </el-table>

  <el-dialog
    :title="isEdit ? '编辑' : '新增'"
    v-model="visible"
    width="700px"
    destroy-on-close
    :close-on-click-modal="false"
    @close="closeDialog"
  >
    <TableEdit
      :form-data="rowData"
      :options="options"
      :edit="isEdit"
      :update="alter"
    />
  </el-dialog>
  </div>
</template>

<script lang="ts" setup>
import { ref, onMounted } from "vue";
import axios from "axios";
import { FormOption } from "@/types/form-option";
import { ElMessage, ElMessageBox } from "element-plus";
import { StudyRoom } from "@/types/study-room";
import row from "element-plus/es/components/row";

// 新增/编辑弹窗相关
const options = ref<FormOption>({
  labelWidth: "100px",
  span: 24,
  list: [
    { type: "input", label: "类型", prop: "type", required: true },
    { type: "input", label: "容量", prop: "capacity", required: true },
    {
      type: "input",
      label: "剩余容量",
      prop: "studyRoomNumber",
      required: true,
    },
    { type: "input", label: "设备", prop: "facilities", required: true },
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

const openDialogAdd = () => {
  visible.value = true;
  isEdit.value = false;
};

const tableData = ref([]);

const token = localStorage.getItem("token"); // 替换为实际的 Token 值
const headers = { token: `${token}` };

const getResponseData = async () => {
  const response = await axios.get("http://localhost:8989/study-rooms/", {
    headers,
  });
  tableData.value = response.data.data;
};

const alter = async (room: StudyRoom) => {
  localStorage.setItem('studyRoomId',room.studyRoomId)
  const responseData = await axios.put(
    `http://localhost:8989/study-rooms?isEdict=${isEdit.value}`,
    room,
    { headers }
  );
  if (responseData.data.code === 200) {
    ElMessage.success(responseData.data.msg);
  }
};

const deleteRoom = async (room: StudyRoom) => {
  try {
    ElMessageBox.confirm("确定要删除吗？", "提示", {
      type: "warning",
    })
    .then(async () => {
      const response = await axios.delete(`http://localhost:8989/study-rooms/${localStorage.getItem('studyRoomId')}`, {
        headers,
      });
      if (response.data.code === 200) {
        ElMessage.success(response.data.msg);
        // 删除成功后,重新获取并更新表格数据
        await getResponseData();
      } else {
        ElMessage.error(response.data.msg);
      }
    })
    .catch(() => {});
  } catch (error) {
    console.error("Error deleting study room:", error);
    ElMessage.error("Failed to delete study room");
  }
};

const handleClick = () => {
  console.log("click");
};

onMounted(getResponseData);
</script>
@/types/study-room
