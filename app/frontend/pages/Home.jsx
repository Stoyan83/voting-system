import React from "react";

const Home = () => {
  return (
    <div className="d-flex justify-content-center align-items-center vh-100 bg-light">
      <div className="text-center p-5 border rounded-3 shadow-lg bg-white w-50">
        <h1 className="display-3 fw-bold text-secondary mb-4">Welcome to React Router</h1>
        <p className="lead mb-4">
          This is a prototype of a fully functional React frontend embedded inside a Rails application.
          All routes with a scope of <span className="fw-bold text-info">/modern</span> will be handled by the React Router. 
          <span className="fw-bold"> For the full version, get me in your team!</span>
        </p>
      </div>
    </div>
  );
};

export default Home;
