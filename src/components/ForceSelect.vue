<template>
    <div>
    <select class="form-select" aria-label="Default select example" @change="changeItem($event)">
        <option v-if="isLoading" value="null" selected=true>Loading...</option>
        <option v-if="!isLoading" value="null" selected=true>Please select...</option>
        <option v-for="force in forces" v-bind:key="force.id" :value=force.id>{{force.name}}</option>
    </select>
    </div>
</template>

<script>
  import axios from 'axios';
  
  export default {
      name: 'ForceSelect',
      data() {
        return {
          forces: null,
          isLoading: null
        };
      },
      created: function() {
        this.isLoading=true;
        axios
          .get('https://data.police.uk/api/forces')
          .then(res => {
            this.forces = res.data;
            this.isLoading=false;
          })
      },
      methods:{
        changeItem: function(event){
          this.$emit('force-change',event.target.value);
        }
      }
    }
</script>

<style>

</style>
