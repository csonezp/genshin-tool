<template>
  <section class="section">
    <div class="container">
      <h1 class="title">
        原神伤害期望计算器
      </h1>
      <div class="notification is-success">
        请输入<strong>暴击率</strong>、<strong>暴击伤害加成</strong>、<strong>暴击伤害数值</strong>
      </div>

      <p class="subtitle">

      </p>
      <div class="field">
        <label class="label">暴击率</label>
        <div class="control">
          <input class="input" v-model="criticalChance" type="text" placeholder="百分号前面的数字，例如70">
        </div>
      </div>

      <div class="field">
        <label class="label">暴击伤害加成</label>
        <div class="control">
          <input class="input" v-model="criticalAddition" type="text" placeholder="百分号前面的数字，例如150">
        </div>
      </div>

      <div class="field">
        <label class="label">暴击伤害数值</label>
        <div class="control">
          <input class="input" v-model="criticalDamage" type="text" placeholder="实际暴击伤害的数值">
        </div>
      </div>

      <div class="field">
        <label class="label">伤害期望</label>
        <div class="control">
          <input class="input" v-model="damageExpect" readonly type="text" placeholder="计算后显示">
        </div>
      </div>

      <button id="submit" @click="cal" class="button is-primary">计算</button>


    </div>
  </section>
</template>

<script>


export default {
  name: 'HomePage',
  props: {
    // msg: String
  },
  data() {
    return {
      criticalChance: '',
      criticalAddition: '',
      criticalDamage: '',
      damageExpect: ''
    }
  },
  methods: {
    cal() {
      let x = this.criticalDamage
      let y = (100 + parseInt(this.criticalAddition)) / 100
      let z = (10000 + parseInt(this.criticalChance) * parseInt(this.criticalAddition)) / 10000
      this.damageExpect = parseInt(x / y * z)
    }

  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
@import "https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css";
</style>
