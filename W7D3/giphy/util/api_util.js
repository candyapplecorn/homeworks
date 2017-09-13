const APIUtil = {
    fetchSearchGiphys(searchTerm){
        const queryString = `http://api.giphy.com/v1/gifs/search?q=${searchTerm}&api_key=dc6zaTOxFJmzC&limit=2`;
        return $.ajax({
          method: 'GET',
          url: queryString,
          type: 'JSON'
        })
    }
};

export default APIUtil;
