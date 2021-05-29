<template>
    <div>
    <select class="form-select" aria-label="Default select example" @change="changeItem($event)">
        <option v-for="force in forces" v-bind:key="force.id" :value=force.id>{{force.name}}</option>
    </select>
    </div>
</template>

<script>
  import axios from 'axios';
  import {bus} from '../main';
  export default {
      name: 'ForceSelect',
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
      },
      methods:{
        changeItem: function(event){
          this.$emit('force-change',event.target.value)
          bus.$emit('force-change',event.target.value)
        }
      }
    }
</script>

<style>

</style>
