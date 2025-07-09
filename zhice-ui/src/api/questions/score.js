import request from '@/utils/request'

// 查询角色列表
export function listScore(query) {
  return request({
    url: 'questions/prototype/search1',
    method: 'get',
    params: query
  })
}

// 查询列表
export function listPost(query) {
  return request({
    url: 'questions/prototype/search',
    method: 'get',
    params: query
  })
}

// 删除
export function delPost(recordId) {
  return request({
    url: '/questions/prototype/' + recordId,
    method: 'delete'
  })
}

