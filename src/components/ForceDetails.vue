<template>
  <div class="card">
    <h3>Force Details</h3>
    <div v-if="forceDetails" v-html="forceDetails.description"></div>
    <table class="table" v-if="forceDetails">
      <thead>
        <tr>
          <th scope="col">Platform</th>
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
  import {bus} from '../main';

  export default {
    name: 'ForceDetails',
    data() {
      return {
        forceDetails: null,
      };
    },
    created(){
          bus.$on('force-change', (force_id) => {
            this.getForceDetails(force_id);
          })
    },
    methods: {
     getForceDetails(forceID) {
        axios
            .get('https://data.police.uk/api/forces/'+forceID)
            .then(res => {
              this.forceDetails = res.data;
            })
        }
    }
  }
</script>
<style>
  h3 {
    margin-bottom: 5%;
  }
</style>
