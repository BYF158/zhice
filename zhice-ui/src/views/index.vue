<template>
  <div class="app-container home">
    <div class="center-container">
    <el-row :gutter="20">
      <!-- <el-col :sm="24" :lg="12" style="padding-left: 20px"> -->
        <el-col :sm="224" :md="20" :lg="16" :xl="12" class="content-col">
        <h2>原型探索量表</h2>
        <div style="margin: 20px 0; text-align: center;">
          <img
            src="@/photo/psy.jpg"
            style="max-width: 100%;; height: auto;max-height: 400px;border-radius: 4px;"
            />
        </div>
        <p>人格的十二原型测试是由心理学家卡罗尔·皮尔斯（Carol S. Pearson）和马克·休斯顿（Hughes M. Hamilton）共同开发的一种测试，主要是以帮助人们了解自己的人格类型和倾向。

以下是十二个常见的人格原型，每个原型代表着一种独特的人格类型和特征：</p>
    <div style="display: flex; justify-content: center;">
  <div style="text-align: left; max-width: 800px; margin: 20px;">
    <p>1. 治愈者（The Caregiver）：慈悲、无私、关怀他人。</p>
    <p>2. 爱人（The Lover）：热情、浪漫、追求爱与美。</p>
    <p>3. 探险家（The Explorer）：冒险、自由、探索新事物。</p>
    <p>4. 英雄（The Hero）：勇敢、倡导正义、保护他人。</p>
    <p>5. 创造者（The Creator）：创造力、想象力、独特性。</p>
    <p>6. 智者（The Sage）：智慧、理智、寻求真理。</p>
    <p>7. 顽童（The Jester）：幽默、玩世不恭、娱乐他人。</p>
    <p>8. 普通人（The Regular Person）：真实、朴素、务实。</p>
    <p>9. 父母（The Caregiver）：支持、保护、为他人着想。</p>
    <p>10. 收割者（The Ruler）：领导、权力、责任。</p>
    <p>11. 魔法师（The Magician）：擅长变革、神秘、领悟力。</p>
    <p>12. 独裁者（The Innocent）：天真、单纯、对世界持乐观态度。</p>
  </div>
</div>





      </el-col>


    </el-row>

   </div>
  </div>
</template>

<script>

</script>

<style scoped lang="scss">
.home {
  blockquote {
    padding: 10px 20px;
    margin: 0 0 20px;
    font-size: 17.5px;
    border-left: 5px solid #eee;
  }
  hr {
    margin-top: 20px;
    margin-bottom: 20px;
    border: 0;
    border-top: 1px solid #eee;
  }
  .col-item {
    margin-bottom: 20px;
  }

  ul {
    padding: 0;
    margin: 0;
  }

  font-family: "open sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
  font-size: 13px;
  color: #676a6c;
  overflow-x: hidden;

  ul {
    list-style-type: none;
  }

  h4 {
    margin-top: 0px;
  }

  h2 {
    text-align: center;
    margin-top: 10px;
    font-size: 26px;
    font-weight: 100;
  }

  p {
    margin-top: 10px;

    b {
      font-weight: 700;
    }
  }

}
.center-container {

  max-width: 1200px;
  margin: 0 auto;
  padding: 0 20px;
  box-sizing: border-box;
}
// 新增：内容列样式优化
.content-col {

  margin: 0 auto;
  // 内容区内边距，避免文本贴边
  padding: 30px;
  border-radius: 8px;
}
</style>

