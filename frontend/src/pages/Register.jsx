import { useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { useAuth } from '../utils/AuthContext';
import api from '../utils/api';

export default function Register() {
  const { login } = useAuth();
  const navigate = useNavigate();
  const [form, setForm] = useState({ name: '', email: '', password: '' });
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(false);

  const handle = (e) => setForm({ ...form, [e.target.name]: e.target.value });

  const submit = async (e) => {
    e.preventDefault();
    if (form.password.length < 6) { setError('Password must be at least 6 characters'); return; }
    setError('');
    setLoading(true);
    try {
      const { data } = await api.post('/auth/register', form);
      login({ userId: data.userId, name: data.name, email: data.email }, data.token);
      navigate('/dashboard');
    } catch (err) {
      setError(err.response?.data?.message || 'Registration failed.');
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="page-center">
      <div style={{ width: '100%', maxWidth: 420 }}>
        <div style={{ textAlign: 'center', marginBottom: 32 }}>
          <div style={{
            display: 'inline-flex', alignItems: 'center', justifyContent: 'center',
            width: 52, height: 52, borderRadius: 14,
            background: 'var(--accent)', fontSize: 24, marginBottom: 12
          }}>🧠</div>
          <h1 style={{ fontSize: 26, fontWeight: 700 }}>HirePrep</h1>
          <p style={{ color: 'var(--muted)', fontSize: 14, marginTop: 4 }}>Create your account</p>
        </div>

        <div className="card">
          <form onSubmit={submit}>
            <div className="input-group">
              <label>Full Name</label>
              <input
                name="name" type="text" placeholder="Your name"
                value={form.name} onChange={handle} required
              />
            </div>
            <div className="input-group">
              <label>Email</label>
              <input
                name="email" type="email" placeholder="you@example.com"
                value={form.email} onChange={handle} required
              />
            </div>
            <div className="input-group">
              <label>Password</label>
              <input
                name="password" type="password" placeholder="Min. 6 characters"
                value={form.password} onChange={handle} required
              />
            </div>
            {error && <p className="error-msg">{error}</p>}
            <button className="btn btn-primary" type="submit"
              disabled={loading} style={{ width: '100%', marginTop: 8 }}>
              {loading ? 'Creating account…' : 'Create Account'}
            </button>
          </form>
        </div>

        <p style={{ textAlign: 'center', marginTop: 20, color: 'var(--muted)', fontSize: 14 }}>
          Already have an account?{' '}
          <Link to="/login" style={{ color: 'var(--accent)', textDecoration: 'none', fontWeight: 600 }}>
            Sign In
          </Link>
        </p>
      </div>
    </div>
  );
}
