<template>
  <div class="row">
    <div class="col col-md-8">
      <div v-if="isLoading">Loading ... </div>
      <div v-if="!isLoading && neighbourhoodDetails " v-html="neighbourhoodDetails.description"></div>
    </div> 
    <div class="col col-md-4">
      <iframe width="325" height="280" frameborder="0" :src="mapUrl" scrolling="no">
      </iframe>
      <div style="white-space: nowrap; text-align: center; width: 325px; padding: 6px 0;">
          <a id="largeMapLink" target="_blank" href="https://www.bing.com/maps?cp=51.528099999999995~-0.3053000000000017&amp;sty=r&amp;lvl=11&amp;FORM=MBEDLD">View Larger Map</a> &nbsp; | &nbsp;
          <a id="dirMapLink" target="_blank" href="https://www.bing.com/maps/directions?cp=51.528099999999995~-0.3053000000000017&amp;sty=r&amp;lvl=11&amp;rtp=~pos.51.528099999999995_-0.3053000000000017____&amp;FORM=MBEDLD">Get Directions</a>
      </div>
    </div>
  </div>
</template>

<script>
  import axios from 'axios';

  export default {
    name: 'NeighbourhoodDetails',
    props:[
      "force-id",
      "neighbourhood-id",
    ],
    data() {
      return {
        neighbourhoodDetails: null,
        neighbourhoodBoundary: null,
        isLoading: null,
        mapUrl:""
      };
    },
    watch: { 
      forceId() { // watch it
          this.neighbourhoodDetails=null;
          this.mapUrl="";
        },
      neighbourhoodId(){
        this.apiCall();
      }
    },
    methods: {
      apiCall() {
        this.isLoading=true;
        axios
            .get('https://data.police.uk/api/'+this.forceId+'/'+this.neighbourhoodId)
            .then(res => {
              this.neighbourhoodDetails = res.data;
              this.mapUrl="https://www.bing.com/maps/embed?h=280&w=325&cp="+this.neighbourhoodDetails.centre.latitude+"~"+this.neighbourhoodDetails.centre.longitude+"&lvl=11&typ=d&sty=r&src=SHELL&FORM=MBEDV8";
              this.isLoading = false;
            })
        axios
            .get('https://data.police.uk/api/'+this.forceId+'/'+this.neighbourhoodId+"/boundary")
            .then(res => {
              this.neighbourhoodBoundary = res.data;
              console.log(res.data);
            })

      }
    }
  }
</script>
<style>
</style>
