function App() {
  return (
    <div className="cover-container d-flex h-100 p-3 mx-auto flex-column">
      <header className="masthead mb-auto">
        <div className="inner">
          <h3 className="masthead-brand" data-testid="header">
            Cool Web App
          </h3>
          {/* <nav className="nav nav-masthead justify-content-center">
            <a className="nav-link active" href="/">
              Home
            </a>
            <a className="nav-link" href="/">
              Features
            </a>
            <a className="nav-link" href="/">
              Contact
            </a>
          </nav> */}
        </div>
      </header>

      <main data-testid="center-text" role="main" className="inner cover">
        <h1 className="cover-heading shadow-lg">
          Progressive Web Application.
        </h1>
        <p className="lead shadow-lg">
          Create your own awesome web application with a CI/CD pipeline using
          Terraform, Github actions and AWS. Follow the instructions in the
          README from the Github repository below.
        </p>
        <p className="lead">
          <a
            href="https://github.com/subaquatic-pierre/pwa-infrastructure"
            target="_blank"
            className="btn btn-lg btn-secondary"
            rel="noreferrer"
          >
            Learn more
          </a>
        </p>
        <p>STAGING AREA</p>
      </main>

      <footer data-testid="footer" className="mastfoot mt-auto">
        <div className="inner">
          <p>Cool Web App</p>
        </div>
      </footer>
    </div>
  );
}

export default App;
