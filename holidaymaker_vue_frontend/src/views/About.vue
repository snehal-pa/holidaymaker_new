<template>
  <div class="about container">
    <p class="h1 bold" style="text-align:center">About Us</p>
    <div class="row" >
      <div class="col-12 col-md-6 col-lg-4 mt-5 position-static" v-for="h in hotels" :key="h.index">
        <div class="d-flex justify-content-between">
          <h3 class="m-0 d-flex align-items-center main-color">{{h.location}}</h3>
        </div>

        <div class="image">
          <img class="img-fluid border border-primary rounded" :src="require('../assets/' +h.image + '.jpg')" />
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data(){
    return{
      hotels: [
        {
          image:"hotel1",
          location:"Madrid"
        },
        {
          image:"hotel2",
          location:"Barcelona"
        },
        {
          image:"hotel3",
          location:"Valencia"
        },
        {
          image:"hotel4",
          location:"Granada"
        },
        {
          image:"hotel5",
          location:"Alhambra"
        },
        {
          image:"hotel6",
          location:"Seville"
        },
        {
          image:"hotel7",
          location:"Barcelona"
        },
        {
          image:"hotel8",
          location:"Madrid"
        },
        {
          image:"hotel9",
          location:"Barcelona"
        },
        {
          image:"hotel10",
          location:"Madrid"
        },
        {
          image:"hotel11",
          location:"Seville"
        },
        {
          image:"hotel12",
          location:"Granada"
        }
      ]
    
  }
}
}
</script>
