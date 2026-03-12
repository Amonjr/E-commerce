import Header from "../components/header/Header";
import { Outlet } from "react-router-dom";

export default function Layout() {
    return (
        <div className='App flex flex-col min-h-screen'>
            <Header />
            <main className="flex-grow">
                <Outlet />
            </main>
            <footer className="w-full text-center py-6 text-gray-700 bg-gray-100 shadow-inner mt-auto">
                <p>Made with ❤️ by <a href="https://github.com/asus" target="_blank" rel="noopener noreferrer" className="font-semibold text-blue-600 hover:text-blue-800">asus</a></p>
                <div className="flex justify-center gap-4 mt-2 text-sm">
                    <a href="https://github.com/asus" target="_blank" rel="noopener noreferrer" className="hover:text-black">GitHub</a>
                    <a href="https://linkedin.com/in/asus" target="_blank" rel="noopener noreferrer" className="hover:text-blue-700">LinkedIn</a>
                </div>
            </footer>
        </div>
    )
}
