function App() {
  return (
    <div class="cover-container d-flex h-100 p-3 mx-auto flex-column">
      <header class="masthead mb-auto">
        <div class="inner">
          <h3 class="masthead-brand">Cool Web App</h3>
          {/* <nav class="nav nav-masthead justify-content-center">
            <a class="nav-link active" href="/">
              Home
            </a>
            <a class="nav-link" href="/">
              Features
            </a>
            <a class="nav-link" href="/">
              Contact
            </a>
          </nav> */}
        </div>
      </header>

      <main role="main" class="inner cover">
        <h1 class="cover-heading shadow-lg">Progressive Web Application.</h1>
        <p class="lead shadow-lg">
          Create your own awesome web application with a CI/CD pipeline using
          Terrafrom, Github actions and AWS. Follow the instructions in the
          README from the Github repository below.
        </p>
        <p class="lead">
          <a
            href="https://github.com/subaquatic-pierre/pwa-infrastructure"
            target="_blank"
            class="btn btn-lg btn-secondary"
            rel="noreferrer"
          >
            Learn more
          </a>
        </p>
      </main>

      <footer class="mastfoot mt-auto">
        <div class="inner">
          <p>Cool Web App</p>
        </div>
      </footer>
    </div>
  );
}

export default App;
