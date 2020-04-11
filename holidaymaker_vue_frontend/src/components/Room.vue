<template>
  <div class="room clearfix">
        <div class="content">
      <h2>{{room.type}}</h2>
      <p>{{room.hotel.name}}</p>
      <p>{{room.price}}</p>
      <p>{{room.rating}}</p>

      <button @click="addToBooking(room)">Book now</button>
    </div>
  </div>
</template>

<script>
export default {
  // "props" är egna HTML-attribut som vi kan låta en annan komponent skicka in data med.
  props: ['room', 'addToBooking']
}
</script>