<template>
  <div class="container">
    <h3>UK Police Forces</h3>
    <table class="table">
      <thead>
        <tr>
          <th scope="col">Id</th>
          <th scope="col">Name</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="force in forces" v-bind:key="force.id"> 
          <th scope="row">{{force.id}}</th>
          <td>{{force.name}}</td>
        </tr>
      </tbody>
    </table> 
  </div> 
</template>

<script>
  import axios from 'axios';
  export default {
    name: 'Forces',
    data() {
      return {
        forces: null,
      };
    },
    created: function() {
      axios
        .get('https://data.police.uk/api/forces')
        .then(res => {
          this.forces = res.data;
        })
    }
  }
</script>
<style>
</style>
