<template>
    <div>
    <select class="form-select" aria-label="Default select example" @change="changeItem($event)">
        <option v-if="isLoading" value="null" selected=true>Loading...</option>
        <option v-if="!isLoading" value="null" selected=true>Please select...</option>
        <option v-for="neighbourhood in neighbourhoods" v-bind:key="neighbourhood.id" :value=neighbourhood.id>{{neighbourhood.name}}</option>
    </select>
    </div>
</template>

<script>
  import axios from 'axios';
  
  export default {
      name: 'NeighbourhoodSelect',
      props:[
          "force-id",
      ],
      data() {
        return {
            neighbourhoods: null,
            isLoading: null,
        };
      },
      watch: { 
        forceId() { // watch it
                this.apiCall();
            }
        },
      methods:{
        changeItem: function(event){
          this.$emit('neighbourhood-change',event.target.value)
        },
        apiCall() {
            this.isLoading=true;
            this.neighbourhoods=null;
            axios
                .get('https://data.police.uk/api/'+this.forceId+'/neighbourhoods')
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
