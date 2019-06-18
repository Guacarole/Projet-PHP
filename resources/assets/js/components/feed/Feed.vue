<template>
    <div v-if="posts" class="mt-4">
        <div v-for="post in posts.data">
            <post :post="post" :key="post.id"></post>
        </div>
    </div>
</template>

<script>
    export default {
        name: "Feed",
        mounted()
        {
            this.getFeed();
        },
        data()
        {
            return {
                loading : false,
                posts : null,
            };

        },
        methods : {
            getFeed(){
                this.loading=true;
                axios.get(`./api/feed`)
                    .then(response=>
                    {
                        this.posts = response.data;
                        this.loading=false;
                    })
            }
        }
    }
</script>

<style scoped>

</style>