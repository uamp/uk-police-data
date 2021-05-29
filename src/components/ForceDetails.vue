<template>
  <div> 
    <div v-if="isLoading">Loading ... </div>
    <div v-if="!isLoading && forceDetails " v-html="forceDetails.description"></div>
    <br>
    <table class="table" v-if="!isLoading && forceDetails">
      <thead>
        <tr>
          <th scope="col">Website</th>
          <th scope="col">Description</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="engagement in forceDetails.engagement_methods" v-bind:key="engagement.title">
          <td><a :href="engagement.url">{{engagement.title}}</a></td>
          <td v-html="engagement.description"></td>
        </tr>
      </tbody>
    </table>
  </div> 
</template>

<script>
  import axios from 'axios';

  export default {
    name: 'ForceDetails',
    props: [
      "force-id"
    ],
    data() {
      return {
        forceDetails: null,
        isLoading: null,
      };
    },
    watch: { 
      forceId() { // watch it
          this.apiCall();
        }
    },
    methods: {
     apiCall() {
       this.isLoading=true;
        axios
            .get('https://data.police.uk/api/forces/'+this.forceId)
            .then(res => {
              this.forceDetails = res.data;
              this.isLoading = false;
            })
        }
    }
  }
</script>
<style>
</style>
