<template>
    <div>
        <div v-for="data in urlData">
            <div class="row mb-2 border-bottom">
                <div class="col-lg-2">
                    <div class="row  align-items-center">
                        {{ data[0].date }}
                    </div>
                </div>
                <div class="col-lg-10">
                    <div class="row">
                        <div v-for="time in data">
                            <div class="col-lg mb-1">
                                <div v-if="time.is_free" class="btn btn-success"
                                     @click="e => {showModal(time.time, time.date, time.price)}"
                                >
                                    <div class="mb-1">
                                        {{ time.time }}
                                    </div>
                                    {{ time.price }}
                                </div>
                                <div v-if="!time.is_free" class="btn btn-danger">
                                    <div class="mb-1">
                                        {{ time.time }}
                                    </div>
                                    {{ time.price }}
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <v-booking ref="modal" :time="this.dataTime" :date="this.dataDate" :price="this.dataPrice" :quest-id="this.questId"></v-booking>
    </div>
</template>

<script>
    import BookingComponent from './BookingComponent'
    Vue.component('v-booking', BookingComponent);
    export default {
        props: [
            'questId',
        ],
        data: function(){
            return {
                urlData: [],
                dataTime: null,
                dataDate: null,
                dataPrice: null,
            }
        },
        mounted(){
            this.update();
        },
        updated(){
            this.update();
        },
        methods: {
            update: function(){
                axios.get('/v1/json-times/' + this.questId)
                    .then((res) =>{
                    this.urlData = JSON.parse(JSON.stringify(res.data));
                })
            },
            showModal: function (time, date, price) {
                this.dataTime = time;
                this.dataDate = date;
                this.dataPrice = price;
                this.$refs.modal.show = true;

            }
        }
    }
</script>

<style scoped>

</style>