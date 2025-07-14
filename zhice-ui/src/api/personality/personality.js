import request from '@/utils/request'

// 查询得分管理列表
export function listPersonality(query) {
  return request({
    url: '/personality/personality/list',
    method: 'get',
    params: query
  })
}

// 查询得分管理详细
export function getPersonality(resultId) {
  return request({
    url: '/personality/personality/' + resultId,
    method: 'get'
  })
}

// 新增得分管理
export function addPersonality(data) {
  return request({
    url: '/personality/personality',
    method: 'post',
    data: data
  })
}

// 修改得分管理
export function updatePersonality(data) {
  return request({
    url: '/personality/personality',
    method: 'put',
    data: data
  })
}

// 删除得分管理
export function delPersonality(resultId) {
  return request({
    url: '/personality/personality/' + resultId,
    method: 'delete'
  })
}

// //获取用户最新一次测试结果
// export function getLastPersonality(params) {
//   return request({
//     url: '/personality/results/getLatestResult',
//     method: 'post',
//     data: params
//   });
// }

export function getLastPersonality(params) {
  return request({
    url: `/personality/results/getLatestResult?userId=${params.userId}`,
    method: 'post'
  });
}

