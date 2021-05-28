<template>
  <div id="app">
    <ForceSelect @force-change="forceChange"/>
    <ForceDetails />
  </div>
  
</template>

<script>
//import Forces from './components/Forces.vue';
import ForceSelect from './components/ForceSelect.vue';
import ForceDetails from './components/ForceDetails.vue';


export default {
  name: 'App',
  components: {
    ForceSelect,
    ForceDetails
  },
  methods: {
    forceChange(selection) {
                console.log(selection);
            }
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: left;
  color: #2c3e50;
  margin: 0px;
}
.card {
  padding: 60px;
  margin: 30px;
  background-color: rgb(231, 231, 231);
}
</style>
