var app;

const apiRoutes = {
    "complete" : "/api/v1/address/complete"
};
    

const appData = {
    "search_string"  : "ddd",
    "search_results" : [ { "id" : "0", "n" : "Nothing yet"} ],
    "search_status"  : "free", // loading, free
    "search_message" : ""
};

const appMethods = {
    query_search : function () {
        if (this.search_status !== "free") {
            return;
        }
        
        this.search_status = "loading";
        
        fetch(apiRoutes.complete + "?query=" + this.search_string).then(response => response.json())
            .then(
                function(response) {
                    app.$data.search_results = response.results;

                    app.$data.search_status = "free";
                }
        );

    }
};

app = new Vue({
    data : appData,
    methods : appMethods
    
});

app.$mount('#app');
