import request from '@/utils/request'

// 查询题目管理列表
export function listTopic(query) {
  return request({
    url: '/questions/topic/list',
    method: 'get',
    params: query
  })
}

// 查询题目管理详细
export function getTopic(topicId) {
  return request({
    url: '/questions/topic/' + topicId,
    method: 'get'
  })
}

// 新增题目管理
export function addTopic(data) {
  return request({
    url: '/questions/topic',
    method: 'post',
    data: data
  })
}

// 修改题目管理
export function updateTopic(data) {
  return request({
    url: '/questions/topic',
    method: 'put',
    data: data
  })
}

// 删除题目管理
export function delTopic(topicId) {
  return request({
    url: '/questions/topic/' + topicId,
    method: 'delete'
  })
}

//分页获取题目
export function getQuestionByPage(pageNum,pageSize=6){
  return request({
    url: '/questions/topic/getQuestionByPage',
    method: 'get',
    params: {
      pageNum,
      pageSize
    }
  }).then(res => {
    // 处理统一结果封装
    if (res && res.data) {
      return Promise.resolve(res.data);
    }
    return Promise.reject(new Error('数据解析失败'));
  })
}

//提交答案
export function submitAnswers(recordData) {
  return request({
    url: '/records',
    method: 'post',
    data: recordData
  })
}

//获取结果
export function getResult(recordId) {
  return request({
    url: '/records/' + recordId,
    method: 'get',
  })
}
