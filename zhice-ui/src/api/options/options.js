import request from '@/utils/request'

// 查询选项管理列表
export function listOptions(query) {
  return request({
    url: '/options/options/list',
    method: 'get',
    params: query
  })
}

// 查询选项管理详细
export function getOptions(optionId) {
  return request({
    url: '/options/options/' + optionId,
    method: 'get'
  })
}

// 新增选项管理
export function addOptions(data) {
  return request({
    url: '/options/options',
    method: 'post',
    data: data
  })
}

// 修改选项管理
export function updateOptions(data) {
  return request({
    url: '/options/options',
    method: 'put',
    data: data
  })
}

// 删除选项管理
export function delOptions(optionId) {
  return request({
    url: '/options/options/' + optionId,
    method: 'delete'
  })
}
