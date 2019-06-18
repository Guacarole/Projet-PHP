<template>
    <div class="mt-4" v-if="posts">
            <div class="card-body">
                <a :herf="`/user/${post.user.id}`">
                    <h5 class="mb-0">{{post.user.name}}</h5>
                </a>
                <small class="text-muted">{{post.created_at}}</small>
                <p class="mt-3">{{post.content}}</p>
            </div>
            <div v-if="post.attachment !== null && post.attachment.type === 'image'" class="border-top">
                <img :src="`/${post.attachment.path}`" class="img-responsive" style="width:100%;" alt="">
            </div>
    </div>
</template>

<script>
    export default {
        name: "Post",
        props : ['post'],

        mounted()
        {

        },
        data()
        {
            return {};
        },
        methods : {

        }
    }
</script>

<style scoped>

</style>