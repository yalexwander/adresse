var app;

const apiRoutes = {
	"complete" : "/api/v1/address/complete"
};

const statusMessages = {
	too_short : { "id" : "0", "n" : "Type at leat 2 characters"},
	no_result : { "id" : "0", "n" : "No results"},
};

const appData = {
	"search_string"	 : "",
	"search_results" : [ statusMessages.too_short ],
	"search_status"	 : "free", // loading, free
	"search_message" : ""
};

const appMethods = {
	query_search : function () {
		if (this.search_status !== "free") {
			return;
		}

		if (this.search_string.length < 2) {
			app.$data.search_results = [ statusMessages.too_short ];
			return;
		}
		
		this.search_status = "loading";
		
		fetch(apiRoutes.complete + "?query=" + this.search_string).then(response => response.json())
			.then(
				function(response) {
					app.$data.search_results = response.results;

					
					if (response.status === "error") {
						app.$data.search_results = [ { id : 0, "n" : response.message } ];
					}
					else if (response.result_count === 0) {
						app.$data.search_results = [ statusMessages.too_short ];
					}
					else {
						app.$data.search_results = response.results;
					}

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
