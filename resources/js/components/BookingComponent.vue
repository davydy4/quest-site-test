<template>
    <div v-if="show" class="modal-shadow" @click.self="closeModal">
        <div class="modal">
            <div class="modal-close" @click="closeModal">&#10006;</div>
            <slot name="title">
                <h3 class="modal-title">Бронирование квеста</h3>
            </slot>
            <slot name="body">
                <div class="modal-content p-3">
                    <div class="m-3">
                        <p class="mb-0">Дата: {{ date }}</p>
                        <p class="mb-0">Время: {{ time }}</p>
                        <p class="mb-0">Цена: {{ price }}</p>
                    </div>
                    <div v-if="!showError && !showSuccess">
                    <form
                            id="form"
                            @submit="checkForm"
                            action="/v1/create-booking"
                            method="post"
                            novalidate="true"
                    >
                        <div class="mb-3">
                            <label for="nameInput" class="form-label">Ваше имя</label>
                            <input type="text" class="form-control" id="nameInput" name="name" v-model="name">
                        </div>
                        <div class="mb-3">
                            <label for="exampleInput" class="form-label">Ваш Email</label>
                            <input type="email" class="form-control" id="exampleInput" name="email" v-model="email">
                        </div>
                        <div class="mb-3">
                            <label for="phoneInput" class="form-label">Ваш телефон</label>
                            <input type="text" class="form-control" id="phoneInput" v-mask="'+7 (###) ###-##-##'" placeholder="(999) 999-99-99" name="phone" v-model="phone">
                        </div>
                        <p v-if="errors.length">
                            <b>Пожалуйста исправьте указанные ошибки:</b>
                        <ul>
                            <li v-for="error in errors">{{ error }}</li>
                        </ul>
                        </p>
                    </form>
                    </div>
                    <div v-if="showSuccess">
                        <div>
                            <h2>
                                Квест успешно забронирован
                            </h2>
                        </div>
                    </div>
                    <div v-if="showError">
                        <div>
                            <h2>
                                Ошибка бронирования
                            </h2>
                        </div>
                    </div>
                </div>
            </slot>
            <slot name="footer">
                <div class="modal-footer">
                    <div v-if="!showError && !showSuccess">
                    <button class="modal-footer__button" @click="checkForm">
                        Забронировать
                    </button>
                    </div>
                </div>
            </slot>
        </div>
    </div>
</template>

<script>
    import Vue from 'vue';
    import VueMask from 'v-mask';
    Vue.use(VueMask);

    export default {
        props: [
            'time',
            'date',
            'price',
            'questId'
        ],
        data: function () {
            return {
                show: false,
                errors: [],
                name: null,
                email: null,
                phone: '',
                showSuccess: false,
                showError: false
            }
        },
        mounted(){
            //
        },
        updated(){
            //
        },
        methods: {
            closeModal: function () {
                this.show = false;
                this.errors = [];
                this.name = null;
                this.email = null;
                this.phone = null;
                this.showSuccess = false;
                this.showError = false;
            },
            checkForm: function (e) {
                this.errors = [];

                if (!this.name) {
                    this.errors.push('Укажите имя.');
                }
                if (!this.email) {
                    this.errors.push('Укажите электронную почту.');
                } else if (!this.validEmail(this.email)) {
                    this.errors.push('Укажите корректный адрес электронной почты.');
                }
                if (!this.phone) {
                    this.errors.push('Укажите номер телефона.');
                }

                if (!this.errors.length) {
                    this.sendForm();
                }

                e.preventDefault();
            },
            validEmail: function (email) {
                let re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                return re.test(email);
            },
            sendForm: function(){
                axios.post('/v1/create-booking', { params: {
                    time:       this.time,
                    date:       this.date,
                    quest_id:   this.questId,
                    name:       this.name,
                    email:      this.email,
                    price:      this.price,
                    phone:      this.phone
                    }})
                    .then((res) =>{
                        if(res.data)
                        {
                            this.showSuccess = true;
                        }
                        else {
                            this.showError = true;
                        }
                        
                    })
                    .catch(function() {
                        console.log('FAILURE!!');
                    });
            },
        }
    }
</script>

<style scoped
       lang="scss">
    .modal-shadow {
        position: fixed;
        top: 0;
        left: 0;
        min-height: 100%;
        width: 100%;
        background: rgba(0, 0, 0, 0.39);
    }

    .modal {
        background: #fff;
        border-radius: 8px;
        padding: 15px;
        min-width: 420px;
        max-width: 480px;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        display: block;
        height: initial;

        &-close {
            border-radius: 50%;
            color: #fff;
            background: #2a4cc7;
            display: flex;
            align-items: center;
            justify-content: center;
            position: absolute;
            top: 7px;
            right: 7px;
            width: 30px;
            height: 30px;
            cursor: pointer;
        }

        &-title {
            color: #0971c7;
        }

        &-content {
            margin-bottom: 20px
        }

        &-footer {
            &__button {
                background-color: #0971c7;
                color: #fff;
                border: none;
                text-align: center;
                padding: 8px;
                font-size: 17px;
                font-weight: 500;
                border-radius: 8px;
                min-width: 150px;
            }
        }
    }
</style>