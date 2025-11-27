document.addEventListener('DOMContentLoaded', () => {
  const searchInput = document.getElementById('search-input');
  const resultsContainer = document.getElementById('search-results');
  
  if (!searchInput || !resultsContainer) return;
  
  searchInput.addEventListener('focus', () => {
    resultsContainer.classList.remove('hidden');
  });
  
  document.addEventListener('click', (e) => {
    if (!searchInput.contains(e.target) && !resultsContainer.contains(e.target)) {
      resultsContainer.classList.add('hidden');
    }
  });
  
  searchInput.addEventListener('input', performSearch);
  
  function performSearch() {
    const query = searchInput.value.toLowerCase();
    
    if (query.length < 2) {
      resultsContainer.innerHTML = '';
      resultsContainer.classList.add('hidden');
      return;
    }
    
    fetch('/index.json')
      .then(response => response.json())
      .then(data => {
        const results = data.filter(item => {
          return item.title.toLowerCase().includes(query) || 
                 (item.description && item.description.toLowerCase().includes(query));
        }).slice(0, 5);
        
        displayResults(results);
      });
  }
  
  function displayResults(results) {
    if (results.length === 0) {
      resultsContainer.innerHTML = '<small class="p-4 text-smtext-gray-500">No results found</small>';
      resultsContainer.classList.remove('hidden');
      return;
    }
    
    const resultsList = results.map(item => `
      <div class="p-4 border-b border-gray-200">
        <small class="mb-2">
          <a href="${item.permalink}" class="hover:text-blue-800">${item.title}</a>
        </small>

      </div>
    `).join('');
    
    resultsContainer.innerHTML = resultsList;
    resultsContainer.classList.remove('hidden');
  }
});

        // ${item.description ? `<p class="text-gray-700">${item.description}</p>` : ''}