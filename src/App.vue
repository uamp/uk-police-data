<template>
  <div class="container">
    <div class="card">
      <div class="row">
        <div class="col">
          <h3>UK Police Force</h3>
        </div>
        <div class="col">
        </div>
        <div class="col">
          <ForceSelect @force-change="forceChange"/>
        </div>
      </div>
    <br>
    <ForceDetails :force-id="forceId"/>
    </div>

    <div class="card">
      <div class="row">
        <div class="col">
          <h3>Neighbourhoods</h3>
        </div>
        <div class="col">
        </div>
        <div class="col">
          <NeighbourhoodSelect :force-id="forceId" @neighbourhood-change="neighbourhoodChange"/>
        </div>
      </div>
    <br>
    <Neighbourhoods />
    </div>

  </div>
  
</template>

<script>
//import Forces from './components/Forces.vue';
import ForceSelect from './components/ForceSelect.vue';
import ForceDetails from './components/ForceDetails.vue';
import Neighbourhoods from './components/Neighbourhoods.vue';
import NeighbourhoodSelect from './components/NeighbourhoodSelect.vue';

export default {
  name: 'App',
  components: {
    ForceSelect,
    ForceDetails,
    Neighbourhoods,
    NeighbourhoodSelect,
  },
  data() {
    return {
      forceId: null,
      neighbourhoodId: null,
    };
  },
  methods: {
    forceChange(selection) {
      this.forceId=selection;
    },
    neighbourhoodChange(selection){
      this.neighbourhoodId=selection;
    },
  }
}
</script>

<style>
html,body{
  background-color: rgb(240, 240, 240);
}
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: left;
  color: #2c3e50;
}
.card {
  padding: 60px;
  margin: 30px;
  
}
</style>
