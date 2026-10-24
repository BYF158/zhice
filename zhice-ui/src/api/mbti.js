import request from '@/utils/request'

// 获取 MBTI 题库
export function getMbtiQuestions() {
  return request({
    url: '/mbti/questions',
    method: 'get'
  })
}

// 提交答卷（返回测试结果）
export function submitMbtiAnswers(data) {
  return request({
    url: '/mbti/submit',
    method: 'post',
    data: data
  })
}

// 按记录ID查询结果
export function getMbtiResult(recordId) {
  return request({
    url: '/mbti/result/' + recordId,
    method: 'get'
  })
}

// 我的测试记录
export function getMyMbtiRecords() {
  return request({
    url: '/mbti/myRecords',
    method: 'get'
  })
}

// 十六型人格列表
export function listMbtiTypes(query) {
  return request({
    url: '/mbti/type/list',
    method: 'get',
    params: query
  })
}

// 单个类型详情
export function getMbtiType(typeCode) {
  return request({
    url: '/mbti/type/' + typeCode,
    method: 'get'
  })
}

// 全部测试记录（管理端）
export function listMbtiRecords(query) {
  return request({
    url: '/mbti/record/list',
    method: 'get',
    params: query
  })
}

// 删除测试记录
export function delMbtiRecord(recordIds) {
  return request({
    url: '/mbti/record/' + recordIds,
    method: 'delete'
  })
}

// 题目列表（管理端）
export function listMbtiQuestions(query) {
  return request({
    url: '/mbti/question/list',
    method: 'get',
    params: query
  })
}

// 修改题目
export function updateMbtiQuestion(data) {
  return request({
    url: '/mbti/question',
    method: 'put',
    data: data
  })
}
