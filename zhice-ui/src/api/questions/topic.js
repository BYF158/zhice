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
  })
}

//提交答案
export function submitAnswers(recordData,userId) {
  return request({
    url: '/questions/topic/submit-answers',
    method: 'post',
    params: {
      userId
    },
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

/**
 * 获取人格评分数据
 * @param {number} recordId - 记录ID
 * @param {number} userId - 用户ID
 * @returns {Promise<any>}
 */
export function getPersonalityScores(recordId) {
  return request({
    url: `/questions/topic/scores?recordId=${recordId}`,
    method: 'get'
  });
}
