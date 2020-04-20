<template>
    <div>
        <p>customer id: {{getCustId}}</p>
        <p>Your name:{{getCurrentCustomer.firstName}}</p>
        <p>your Room number {{getSelectedRoom.id}}</p>
        <p>{{getSelectedRoom.price}}</p>
        <p>check_in date: {{getCheckIn}}</p>
        <p>check_out date: {{getCheckOut}}</p>

    </div>
</template>

<script>
import { mapState, mapGetters, mapActions, mapMutations } from "vuex";
export default {

    computed:{
        ...mapState([]),
        ...mapGetters(["getCustId","getRoomId","getCheckIn","getCheckOut","getCurrentCustomer","getSelectedRoom"])
    },
    methods:{
        ...mapMutations([]),
        ...mapActions([])
    }

}
</script>