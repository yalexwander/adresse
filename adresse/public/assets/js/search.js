const appData = {
    "search_string"  : "ddd",
    "search_results" : [ { "id" : "0", "n" : "Nothing yet"} ],
    "search_status"  : "free", // delay, loading, free
    "search_message" : ""
};

new Vue({
    data : appData
}).$mount('#app');
