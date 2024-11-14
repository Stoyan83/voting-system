import React from 'react';
import { Link } from 'react-router-dom';

const NotFound = () => {
  return (
    <div className="d-flex justify-content-center align-items-center" style={{ minHeight: '100vh', backgroundColor: '#f8f9fa' }}>
      <div className="text-center p-5 rounded shadow-lg" style={{ backgroundColor: '#fff', maxWidth: '600px', width: '100%' }}>
        <h1 className="display-3 text-danger fw-bold">404</h1>
        <h2 className="text-muted mb-4">Page Not Found</h2>
        <p className="lead mb-4">Sorry, the page you're looking for doesn't exist or has been moved.</p>
        <Link to="/" className="btn btn-primary btn-lg px-4 py-2">
          Go back to Home
        </Link>
      </div>
    </div>
  );
};

export default NotFound;
