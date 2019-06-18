<template>
    <div v-if="posts" class="mt-4">
        <post v-for="post in posts.data" :key="post.id"></post>
    </div>
</template>

<script>
    export default {
        props : ['userId'],
        name: "ListAllPosts",

        mounted()
        {

            this.$root.$on('post-created',post =>{
                if(this.posts === null ){
                    this.getPosts()
                }else {
                    this.posts.data.push(post);
                }

            });
            this.getPosts();
        },

        data()
        {
            return{
                loading : false,
                posts : null,
            };

        },
        methods : {
            getPosts(){
                this.loading=true;
                axios.get(`/api/feed`)
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