<template>
  <div class="container">
    <!-- 页面标题 -->
    <div class="test-title">
      <h1>性格类型测试</h1>
      <p>请从每一行描述中选择最符合您的一项（每行仅选一项）</p>
    </div>

    <!-- 优点部分 -->
    <el-card class="mb-6">
      <template #header>
        <div class="card-header">
          <i class="fa fa-thumbs-up mr-2"></i>优点部分
        </div>
      </template>
      <el-card__body>
        <!-- 类型标题行 -->
        <div class="category-header">
          <el-col :span="6" class="s-category">
            <i class="fa fa-smile-o mr-2"></i>S（活泼型）
          </el-col>
          <el-col :span="6" class="c-category">
            <i class="fa fa-bolt mr-2"></i>C（力量型）
          </el-col>
          <el-col :span="6" class="m-category">
            <i class="fa fa-paint-brush mr-2"></i>M（完美型）
          </el-col>
          <el-col :span="6" class="p-category">
            <i class="fa fa-leaf mr-2"></i>P（和平型）
          </el-col>
        </div>

        <!-- 优点选项行 -->
        <div v-for="(row, index) in advantageRows" :key="index" class="option-row">
          <el-row>
            <el-col :span="6">
              <el-radio-group v-model="advantageAnswers[index]">
                <el-tooltip
                  placement="top"
                  :content="advantageTooltips.advantage[index].soption"
                  effect="light"
                >
                  <el-radio :label="'s-' + index" class="tooltip-trigger"  :id="index * 4 + 1">{{ row.soption }}</el-radio>
                </el-tooltip>
              </el-radio-group>
            </el-col>
            <el-col :span="6">
              <el-radio-group v-model="advantageAnswers[index]">
                <el-tooltip
                  placement="top"
                  :content="advantageTooltips.advantage[index].coption"
                  effect="light"
                >
                  <el-radio :label="'c-' + index" class="tooltip-trigger" :id="index * 4 + 2">{{ row.coption }}</el-radio>
                </el-tooltip>
              </el-radio-group>
            </el-col>
            <el-col :span="6">
              <el-radio-group v-model="advantageAnswers[index]">
                <el-tooltip
                  placement="top"
                  :content="advantageTooltips.advantage[index].moption"
                  effect="light"
                >
                  <el-radio :label="'m-' + index" class="tooltip-trigger" :id="index * 4 + 3">{{ row.moption }}</el-radio>
                </el-tooltip>
              </el-radio-group>
            </el-col>
            <el-col :span="6">
              <el-radio-group v-model="advantageAnswers[index]">
                <el-tooltip
                  placement="top"
                  :content="advantageTooltips.advantage[index].poption"
                  effect="light"
                >
                  <el-radio :label="'p-' + index" class="tooltip-trigger" :id="index * 4 + 4">{{ row.poption }}</el-radio>
                </el-tooltip>
              </el-radio-group>
            </el-col>
          </el-row>
        </div>
      </el-card__body>
    </el-card>

    <!-- 缺点部分 -->
    <el-card class="mb-6">
      <template #header>
        <div class="card-header">
          <i class="fa fa-thumbs-down mr-2"></i>缺点部分
        </div>
      </template>
      <el-card__body>
        <!-- 类型标题行 -->
        <div class="category-header">
          <el-col :span="6" class="s-category">
            <i class="fa fa-smile-o mr-2"></i>S（活泼型）
          </el-col>
          <el-col :span="6" class="c-category">
            <i class="fa fa-bolt mr-2"></i>C（力量型）
          </el-col>
          <el-col :span="6" class="m-category">
            <i class="fa fa-paint-brush mr-2"></i>M（完美型）
          </el-col>
          <el-col :span="6" class="p-category">
            <i class="fa fa-leaf mr-2"></i>P（和平型）
          </el-col>
        </div>

        <!-- 缺点选项行 -->
        <div v-for="(row, index) in disadvantageRows" :key="index" class="option-row">
          <el-row>
            <el-col :span="6">
              <el-radio-group v-model="disadvantageAnswers[index]">
                <el-tooltip
                  placement="top"
                  :content="advantageTooltips.disadvantage[index].soption"
                  effect="light"
                >
                  <el-radio :label="'s-' + index" class="tooltip-trigger"  :id="80+ index * 4 + 1">{{ row.soption }}</el-radio>
                </el-tooltip>
              </el-radio-group>
            </el-col>
            <el-col :span="6">
              <el-radio-group v-model="disadvantageAnswers[index]">
                <el-tooltip
                  placement="top"
                  :content="advantageTooltips.disadvantage[index].coption"
                  effect="light"
                >
                  <el-radio :label="'c-' + index" class="tooltip-trigger"  :id="'option_' + (index * 4 + 2)">{{ row.coption }}</el-radio>
                </el-tooltip>
              </el-radio-group>
            </el-col>
            <el-col :span="6">
              <el-radio-group v-model="disadvantageAnswers[index]">
                <el-tooltip
                  placement="top"
                  :content="advantageTooltips.disadvantage[index].moption"
                  effect="light"
                >
                  <el-radio :label="'m-' + index" class="tooltip-trigger"  :id="80+ index * 4 +  3">{{ row.moption }}</el-radio>
                </el-tooltip>
              </el-radio-group>
            </el-col>
            <el-col :span="6">
              <el-radio-group v-model="disadvantageAnswers[index]">
                <el-tooltip
                  placement="top"
                  :content="advantageTooltips.disadvantage[index].poption"
                  effect="light"
                >
                  <el-radio :label="'p-' + index" class="tooltip-trigger"  :id="80+ index * 4 +4">{{ row.poption }}</el-radio>
                </el-tooltip>
              </el-radio-group>
            </el-col>
          </el-row>
        </div>
      </el-card__body>
    </el-card>

    <!-- 统计结果 -->
    <el-card v-if="showResults" class="mb-6">
      <template #header>
        <div class="card-header">
          <i class="fa fa-bar-chart mr-2"></i>性格测试结果
        </div>
      </template>
      <el-card__body>
        <el-row :gutter="20">
          <el-col :span="6" v-for="(type, key) in resultTypes" :key="key">
            <el-card :class="`type-card ${type.colorClass}`">
              <div class="type-header">
                <i :class="type.icon"></i>
                <span>{{ type.name }}</span>
              </div>
              <div class="type-scores">
                <div class="score-item advantage">
                  <span class="score-label">优点分:</span>
                  <span class="score-value">{{ type.advantageScore }}</span>
                </div>
                <div class="score-item disadvantage">
                  <span class="score-label">缺点分:</span>
                  <span class="score-value">{{ type.disadvantageScore }}</span>
                </div>
                <div class="score-item total">
                  <span class="score-label">总分:</span>
                  <span class="score-value">{{ type.totalScore }}</span>
                </div>
              </div>
              <div class="type-progress">
                <el-progress :percentage="type.percentage" :color="type.color"></el-progress>
              </div>
            </el-card>
          </el-col>
        </el-row>

        <div class="personality-analysis mt-6">
          <h3>性格分析</h3>
          <p v-if="dominantType">{{ analysisTexts[dominantType] }}</p>
          <p v-else>请完成所有问题后查看分析结果</p>
        </div>
      </el-card__body>
    </el-card>

    <!-- 提交按钮 -->
    <div class="submit-btn">
      <el-button
        type="primary"
        size="large"
        @click="submitAnswers"
        :loading="isLoading"
      >
        {{ showResults ? '重新测试' : '提交答案' }}
      </el-button>
    </div>
  </div>
</template>

<script>
import {listPersonalityOptions, selectOptionDefinition} from "@/api/personality/options";

export default {
  name: 'PersonalityTest',
  data() {
    return {
      // 结果表格数据
      postList: [],
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        userName: undefined,

      },
      // 优点选项数据
      advantageRows: [
        // { s: '生动', c: '富于冒险', m: '善于分析', p: '适应力强' },
        // { s: '喜好娱乐', c: '善于说服', m: '坚持不懈', p: '平和' },
        // { s: '擅于社交', c: '意志坚定', m: '自我牺牲', p: '顺服' },
        // { s: '使人认同', c: '竞争性', m: '体贴', p: '自控性' },
        // { s: '受人喜爱', c: '善于应变', m: '受尊重', p: '含蓄' },
        // { s: '生气勃勃', c: '自立', m: '敏感', p: '满足' },
        // { s: '推动者', c: '积极', m: '计划者', p: '耐性' },
        // { s: '无拘无束', c: '肯定', m: '有时间性', p: '羞涩' },
        // { s: '乐观', c: '坦率', m: '井井有条', p: '迁就' },
        // { s: '有趣', c: '强迫性', m: '忠诚', p: '友善' },
        // { s: '可爱', c: '勇敢', m: '注意细节', p: '外交手腕' },
        // { s: '令人高兴', c: '自信', m: '文化修养', p: '贯彻始终' },
        // { s: '富激励性', c: '果断', m: '理想主义', p: '无攻击性' },
        // { s: '感情外露', c: '独立', m: '深沉', p: '尖刻幽默' },
        // { s: '喜交朋友', c: '发起者', m: '音乐性', p: '调节者' },
        // { s: '多言', c: '执着', m: '考虑周到', p: '容忍' },
        // { s: '活力充沛', c: '领导者', m: '忠心', p: '聆听者' },
        // { s: '惹人喜爱', c: '首领', m: '制图者', p: '知足' },
        // { s: '受欢迎', c: '勤劳', m: '完美主义者', p: '和气' },
        // { s: '跳跃型', c: '无畏', m: '规范型', p: '平衡' }
      ],

      // 缺点选项数据
      disadvantageRows: [
        // { s: '靠骨', c: '专横', m: '忸怩', p: '乏味' },
        // { s: '散漫', c: '无同情心', m: '不宽恕', p: '缺乏热情' },
        // { s: '唠叨', c: '逆反', m: '怨恨', p: '保留' },
        // { s: '健忘', c: '率直', m: '挑剔', p: '胆小' },
        // { s: '好插嘴', c: '急躁', m: '无安全感', p: '优柔寡断' },
        // { s: '难预测', c: '缺同情心', m: '不受欢迎', p: '不参与' },
        // { s: '即兴', c: '固执', m: '难于取悦', p: '犹豫不决' },
        // { s: '放任', c: '自负', m: '悲观', p: '平淡' },
        // { s: '易怒', c: '好争吵', m: '孤芳自赏', p: '无目标' },
        // { s: '天真', c: '鲁莽', m: '消极', p: '冷漠' },
        // { s: '喜获认同', c: '工作狂', m: '不善交际', p: '担忧' },
        // { s: '喋喋不休', c: '不圆滑老练', m: '过分敏感', p: '胆怯' },
        // { s: '生活紊乱', c: '跋扈', m: '抑郁', p: '腼腆' },
        // { s: '缺乏毅力', c: '不客忍', m: '内向', p: '无异议' },
        // { s: '杂乱无章', c: '喜操纵', m: '情绪化', p: '喃喃自语' },
        // { s: '好表现', c: '顽固', m: '有戒心', p: '缓慢' },
        // { s: '大嗓门', c: '统治欲', m: '孤僻', p: '懒惰' },
        // { s: '不专注', c: '易怒', m: '多疑', p: '拖延' },
        // { s: '烦躁', c: '轻率', m: '报复型', p: '勉强' },
        // { s: '善变', c: '狡猾', m: '好批评', p: '妥协' }
      ],

      // 选项解释（鼠标悬停时显示）
      advantageTooltips: {
        advantage: [
          // { s: '性格活泼，能给周围带来活力', c: '愿意尝试新事物，不怕挑战', m: '擅长思考和分析问题', p: '能适应不同环境和变化' },
          // { s: '喜欢轻松愉快的活动和氛围', c: '能有效说服他人接受观点', m: '做事有毅力，不轻易放弃', p: '心态平和，不易动怒' },
          // { s: '善于与人交往，社交能力强', c: '有坚定的意志和决心', m: '愿意为他人付出，牺牲自我', p: '容易顺从，不与人争执' },
          // { s: '能获得他人的认可和好感', c: '具有强烈的竞争意识', m: '能体谅他人，关心别人感受', p: '能控制自己的情绪和行为' },
          // { s: '容易被他人喜欢和接纳', c: '能灵活应对各种情况', m: '行为举止受人尊敬', p: '性格内敛，不张扬' },
          // { s: '精力充沛，充满活力', c: '能独立完成任务，不依赖他人', m: '对事物感受敏锐', p: '容易感到满足，不贪心' },
          // { s: '能推动事情进展，带动他人', c: '态度积极，主动行动', m: '善于规划和安排', p: '有耐心，不急躁' },
          // { s: '不受约束，自由奔放', c: '对自己的判断有信心', m: '时间观念强，守时', p: '性格腼腆，不张扬' },
          // { s: '对事物抱有积极态度', c: '说话直接，不拐弯抹角', m: '做事有条理，整洁有序', p: '愿意迁就他人，不固执' },
          // { s: '风趣幽默，能带来欢乐', c: '有强烈的动力和决心', m: '对人忠诚，值得信赖', p: '待人友善，容易相处' },
          // { s: '可爱讨喜，受人欢迎', c: '勇于面对困难和挑战', m: '关注细节，做事细致', p: '善于协调关系，化解矛盾' },
          // { s: '能给他人带来快乐', c: '对自己有信心', m: '有良好的文化素养', p: '做事能坚持到底，有始有终' },
          // { s: '能激励和鼓舞他人', c: '能迅速做出决定', m: '有理想和追求', p: '性格温和，不具攻击性' },
          // { s: '情绪容易表露在外', c: '不依赖他人，独立自主', m: '思想深刻，有内涵', p: '幽默但不失分寸' },
          // { s: '喜欢结交新朋友', c: '能主动发起行动', m: '有音乐天赋或鉴赏力', p: '善于调节矛盾，维持和谐' },
          // { s: '喜欢与人交流，话语多', c: '对目标执着，不轻言放弃', m: '考虑问题周全', p: '能容忍他人的缺点' },
          // { s: '精力旺盛，充满活力', c: '具备领导才能', m: '对人忠诚，坚守承诺', p: '善于倾听他人诉说' },
          // { s: '让人喜欢，有亲和力', c: '有号召力，能带领他人', m: '善于制定计划和图表', p: '容易满足，不抱怨' },
          // { s: '受大家欢迎和喜爱', c: '工作努力，勤奋肯干', m: '追求完美，对自己要求高', p: '性格温和，待人友善' },
          // { s: '思维跳跃，想法多变', c: '无所畏惧，敢于冒险', m: '做事规范，遵守规则', p: '能平衡不同意见' }
        ],
        disadvantage: [
          // { s: '过于依赖他人，缺乏独立', c: '专断蛮横，听不进意见', m: '举止不自然，过于拘谨', p: '性格乏味，缺乏情趣' },
          // { s: '生活散漫，缺乏规律', c: '对他人处境缺乏同情心', m: '心胸狭窄，不轻易原谅', p: '缺乏热情和积极性' },
          // { s: '说话太多，容易唠叨', c: '喜欢反抗，不服从安排', m: '心怀怨恨，难以释怀', p: '过于保留，不表露想法' },
          // { s: '记忆力差，容易忘记事情', c: '说话直率，不顾及他人感受', m: '过于挑剔，要求过高', p: '胆小怕事，缺乏勇气' },
          // { s: '喜欢打断别人说话', c: '性子急躁，缺乏耐心', m: '对自己缺乏信心', p: '做事犹豫不决，拿不定主意' },
          // { s: '行为难以预测', c: '对他人缺乏同情心', m: '不被他人接纳和喜欢', p: '不愿参与集体活动' },
          // { s: '做事凭一时兴起', c: '固执己见，不愿改变', m: '要求过高，难以满足', p: '遇事犹豫不决' },
          // { s: '放任自己，缺乏约束', c: '自视过高，骄傲自大', m: '态度消极，看问题悲观', p: '生活平淡，缺乏激情' },
          // { s: '容易发怒，脾气不好', c: '喜欢争吵，不易妥协', m: '自命清高，看不起他人', p: '没有明确目标和方向' },
          // { s: '想法简单，不够成熟', c: '做事鲁莽，不考虑后果', m: '态度消极，缺乏动力', p: '对事物冷淡，缺乏关心' },
          // { s: '过于在意他人的认可', c: '工作过度，不注意休息', m: '不善于与人交往', p: '容易担心和焦虑' },
          // { s: '说话太多，没完没了', c: '为人处世不够圆滑', m: '对小事过于敏感', p: '胆小怯懦，缺乏勇气' },
          // { s: '生活没有条理', c: '专横跋扈，盛气凌人', m: '情绪低落，容易抑郁', p: '性格腼腆，不善言辞' },
          // { s: '做事不能坚持到底', c: '不能容忍不同意见', m: '性格内向，不善表达', p: '从不提出异议，缺乏主见' },
          // { s: '生活和工作没有条理', c: '喜欢操纵他人', m: '情绪波动大', p: '自言自语，不善沟通' },
          // { s: '喜欢表现自己，炫耀才华', c: '顽固不化，不愿改变', m: '对他人有防备心理', p: '行动迟缓，反应慢' },
          // { s: '说话声音大，不顾及场合', c: '喜欢控制他人', m: '性格孤僻，不合群', p: '懒惰，不愿付出努力' },
          // { s: '注意力不集中，容易分心', c: '容易发怒，脾气暴躁', m: '对他人不信任，多疑', p: '做事拖延，不及时完成' },
          // { s: '容易烦躁，情绪不稳定', c: '做事轻率，不慎重', m: '报复心强，记仇', p: '做事勉强，不情愿' },
          // { s: '容易改变主意，不坚定', c: '狡猾，喜欢耍手段', m: '喜欢批评他人', p: '容易妥协，缺乏原则' }
        ]
      },

      // 答案存储
      advantageAnswers: Array(20).fill(''),
      disadvantageAnswers: Array(20).fill(''),

      // 状态
      isLoading: false,
      showResults: false,

      // 结果数据
      resultTypes: {
        s: { name: '活泼型(S)', advantageScore: 0, disadvantageScore: 0, totalScore: 0, color: '#f56c6c', colorClass: 's-type', icon: 'fa fa-smile-o', percentage: 0 },
        c: { name: '力量型(C)', advantageScore: 0, disadvantageScore: 0, totalScore: 0, color: '#409eff', colorClass: 'c-type', icon: 'fa fa-bolt', percentage: 0 },
        m: { name: '完美型(M)', advantageScore: 0, disadvantageScore: 0, totalScore: 0, color: '#e6a23c', colorClass: 'm-type', icon: 'fa fa-paint-brush', percentage: 0 },
        p: { name: '和平型(P)', advantageScore: 0, disadvantageScore: 0, totalScore: 0, color: '#909399', colorClass: 'p-type', icon: 'fa fa-leaf', percentage: 0 }
      },

      // 分析文本
      analysisTexts: {
        s: '您的性格类型主要是活泼型(S)。您热情开朗、善于社交，喜欢成为众人瞩目的焦点。您富有创造力，乐观积极，能够给周围的人带来活力和快乐。不过，您可能有时会过于冲动，缺乏耐心，需要注意保持专注和坚持。',
        c: '您的性格类型主要是力量型(C)。您自信果断、勇于挑战，具有很强的领导能力和决策力。您目标明确，行动力强，能够迅速解决问题。不过，您可能有时会过于强势，缺乏耐心倾听他人的意见，需要注意团队合作和沟通技巧。',
        m: '您的性格类型主要是完美型(M)。您细致认真、追求完美，具有很强的分析能力和责任心。您注重细节，善于规划，能够高质量地完成工作。不过，您可能有时会过于挑剔，对自己和他人要求过高，需要注意放松心态和享受生活。',
        p: '您的性格类型主要是和平型(P)。您温和友善、善于协调，具有很强的同理心和包容心。您喜欢和谐的环境，能够与他人友好相处。不过，您可能有时会过于迁就他人，缺乏主见，需要注意表达自己的需求和想法。'
      }
    }
  },
  computed: {
    // 计算主导性格类型
    dominantType() {
      const maxScore = Math.max(
        this.resultTypes.s.totalScore,
        this.resultTypes.c.totalScore,
        this.resultTypes.m.totalScore,
        this.resultTypes.p.totalScore
      );

      if (maxScore === 0) return null;

      const dominantTypes = Object.keys(this.resultTypes).filter(
        key => this.resultTypes[key].totalScore === maxScore
      );

      return dominantTypes.length > 0 ? dominantTypes[0] : null;
    }
  },

  created() {
    this.getList()

  },

  methods: {

    //查询

    /** 查询列表 */
    getList() {

      listPersonalityOptions(this.queryParams).then(response => {
        // this.postList = response.rows;
        this.advantageRows=response.rows.slice(0, 20);
        this.disadvantageRows=response.rows.slice(20,40);
      })
      selectOptionDefinition(this.queryParams).then(response => {
        // this.postList = response.rows;
        this.advantageTooltips.advantage=response.rows.slice(0, 20);
        this.advantageTooltips.disadvantage=response.rows.slice(20,40);
      })
      ()
    },
    // 提交答案
    submitAnswers() {
      // 检查是否所有行都已选择
      const isAdvantageComplete = !this.advantageAnswers.some(answer => !answer);
      const isDisadvantageComplete = !this.disadvantageAnswers.some(answer => !answer);

      if (!isAdvantageComplete || !isDisadvantageComplete) {
        this.$message.warning('请完成所有行的选择！');
        return;
      }

      this.isLoading = true;

      // 模拟提交过程
      setTimeout(() => {
        // 统计各类别的选择数量
        this.calculateScores();

        // 显示结果
        this.showResults = true;
        this.isLoading = false;

        // 滚动到结果区域
        this.$nextTick(() => {
          const resultsCard = document.querySelector('.el-card:nth-child(3)');
          if (resultsCard) {
            resultsCard.scrollIntoView({ behavior: 'smooth', block: 'start' });
          }
        });
      }, 800);
    },

    // 计算各类别得分
    calculateScores() {
      // 重置得分
      Object.keys(this.resultTypes).forEach(key => {
        this.resultTypes[key].advantageScore = 0;
        this.resultTypes[key].disadvantageScore = 0;
        this.resultTypes[key].totalScore = 0;
        this.resultTypes[key].percentage = 0;
      });

      // 统计优点得分
      this.advantageAnswers.forEach(answer => {
        if (answer) {
          const category = answer.charAt(0);
          this.resultTypes[category].advantageScore += 1; // 优点每项2分
        }
      });

      // 统计缺点得分
      this.disadvantageAnswers.forEach(answer => {
        if (answer) {
          const category = answer.charAt(0);
          this.resultTypes[category].disadvantageScore -= 1; // 缺点每项减1分
        }
      });

      // 计算总分和百分比
      const totalPossibleScore = 40; // 20题 * 2分
      Object.keys(this.resultTypes).forEach(key => {
        // 计算总分
        this.resultTypes[key].totalScore =
          this.resultTypes[key].advantageScore +
          this.resultTypes[key].disadvantageScore;

        // 计算百分比（确保不小于0）
        const scoreForPercentage = Math.max(0, this.resultTypes[key].totalScore);
        this.resultTypes[key].percentage = Math.round((scoreForPercentage / totalPossibleScore) * 100);
      });
    }
  }
}
</script>

<style scoped>
.container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 20px;
}
.test-title {
  text-align: center;
  margin-bottom: 30px;
}
.test-title h1 {
  color: #303133;
  font-size: 24px;
  margin-bottom: 10px;
}
.test-title p {
  color: #606266;
  font-size: 14px;
}
.card-header {
  font-size: 18px;
  font-weight: bold;
}
.category-header {
  display: flex;
  justify-content: space-between;
  margin-bottom: 15px;
  padding: 0 10px;
}
.category-header .el-col {
  font-weight: bold;
}
.option-row {
  margin-bottom: 15px;
  padding: 10px 0;
  border-bottom: 1px solid #ebeef5;
}
/* 增加选项悬停效果 */
.tooltip-trigger {
  cursor: pointer;
  transition: all 0.2s;
}
.tooltip-trigger:hover {
  background-color: #f5f7fa;
}
.submit-btn {
  text-align: center;
  margin-top: 30px;
}
.s-category { color: #f56c6c; }
.c-category { color: #409eff; }
.m-category { color: #e6a23c; }
.p-category { color: #909399; }

/* 结果卡片样式 */
.type-card {
  text-align: center;
  padding: 15px;
}
.type-header {
  font-size: 16px;
  margin-bottom: 10px;
}
.type-header i {
  margin-right: 5px;
}
.type-scores {
  margin-bottom: 10px;
  text-align: left;
}
.score-item {
  margin-bottom: 6px;
  font-size: 14px;
}
.score-label {
  display: inline-block;
  width: 60px;
  color: #606266;
}
.score-value {
  font-weight: bold;
}
.advantage .score-value {
  color: #67c23a; /* 优点分用绿色 */
}
.disadvantage .score-value {
  color: #f56c6c; /* 缺点分用红色 */
}
.total .score-value {
  color: #409eff; /* 总分用蓝色 */
  font-size: 16px;
}
.s-type { border-left: 3px solid #f56c6c; }
.c-type { border-left: 3px solid #409eff; }
.m-type { border-left: 3px solid #e6a23c; }
.p-type { border-left: 3px solid #909399; }

.type-progress {
  margin-top: 10px;
}
.personality-analysis {
  padding: 15px;
  background-color: #f9fafc;
  border-radius: 4px;
}
.personality-analysis h3 {
  margin-bottom: 10px;
}

/* 自定义tooltip样式 */
::v-deep .el-tooltip__popper {
  max-width: 200px;
  padding: 8px 12px;
  font-size: 13px;
}
</style>
