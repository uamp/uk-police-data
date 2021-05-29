<template>
  <div class="card">
    <h3>Neighbourhoods</h3>
    <div v-if="isLoading">Loading ... </div>
    <table class="table" v-if="!isLoading">
      <thead>
        <tr>
          <th scope="col">Id</th>
          <th scope="col">Name</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="neighbourhood in neighbourhoods" v-bind:key="neighbourhood.id"> 
          <th scope="row">{{neighbourhood.id}}</th>
          <td>{{neighbourhood.name}}</td>
        </tr>
      </tbody>
    </table> 
  </div> 
</template>

<script>
  import axios from 'axios';
  import {bus} from '../main';

  export default {
    name: 'Neighbourhoods',
    data() {
      return {
        neighbourhoods: null,
        isLoading: null,
      };
    },
    created(){
          bus.$on('force-change', (force_id) => {
            this.getForceNeighbourhoods(force_id);
          })
    },
    methods: {
     getForceNeighbourhoods(force_id) {
       this.isLoading=true;
        axios
            .get('https://data.police.uk/api/'+force_id+'/neighbourhoods')
            .then(res => {
              this.neighbourhoods = res.data;
              this.isLoading = false;
            })
        }
    }
  }
</script>
<style>
</style>
