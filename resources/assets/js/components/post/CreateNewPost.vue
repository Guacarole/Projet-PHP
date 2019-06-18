<template>

    <div class="card">
        <div class="card-header">
            Create Post
        </div>
        <div class="card-body">
            <div class="form-group">

                <label for="content">Post Content</label>
                <textarea name="content"
                          class="form-control"
                          id="content"
                          cols="30"
                          rows="3"
                          v-model="content"
                          :disabled="creatingPost"
                          placeholder="What is your mood of the day ? :)">

                </textarea>

            </div>
        </div>

        <div class="card-footer clearfix">

            <div class="float-left">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="inputGroupFileAddon01">Upload</span>
                    </div>
                    <div class="custom-file">
                        <input type="file"
                               class="custom-file-input"
                               id="inputGroupFile01"
                               ref="fileInput"
                               @change="fileAdded"
                               aria-describedby="inputGroupFileAddon01">
                        <label class="custom-file-label" for="inputGroupFile01">Choose file</label>
                    </div>
                </div>
            </div>

            <div class="float-right">
                <button class="btn btn-primary" @click="createPost()" :disabled="creatingPost">Post</button>
            </div>
        </div>

    </div>

</template>

<script>
    export default {
        name: "CreateNewPost",

        mounted()
        {

        },

        data()
        {
            return{

                creatingPost : false,
                errors : null,

                content : "",
                file : null,

            };

        },
        methods : {

            createPost(){

                this.creatingPost = true;

                let formData = new FormData();
                formData.append('content', this.content);
                if (this.file !== null){
                    formData.append('image', this.file);
                }

                axios.post(`/api/post`, formData)
                    .then(response=>{
                        this.$root.$emit('post-created',response.data.data);
                        this.creatingPost = false;
                    })
                    .catch(error =>{
                        this.creatingPost = false;
                    });
            },

            fileAdded()
            {
               this.file = this.$refs.fileInput.files[0];

            }

        }

    }
</script>

<style scoped lang="scss">

</style>