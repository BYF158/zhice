import request from '@/utils/request'

// 查询角色列表
export function listPersonalityOptions(query) {
  return request({
    url: 'personality/options/list',
    method: 'get',
    params: query
  })
}

export function selectOptionDefinition(query) {
  return request({
    url: 'personality/options/selectOptionDefinition',
    method: 'get',
    params: query
  })
}

export function addOptionRecord(data) {
  return request({
    url: 'personality/records/add',
    method: 'post',
    data: data
  })
}



export function addPersonalityResult(data) {
  return request({
    url: 'personality/results/add',
    method: 'post',
    data: data
  })
}
