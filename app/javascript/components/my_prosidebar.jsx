import React, {useEffect, useState} from 'react';
import { ProSidebar, Menu, MenuItem, SubMenu } from 'react-pro-sidebar';
import 'react-pro-sidebar/dist/css/styles.css';
import { FaTachometerAlt, FaGem, FaList, FaGithub, FaRegLaughWink, FaHeart } from 'react-icons/fa';

// @import '~react-pro-sidebar/dist/scss/styles.scss';


function MyProsidebar(props) {
  const [rooms, setRooms] = useState([]);
  useEffect(() => {
    console.log("My Prosidebar");
    fetch('/api/rooms')
      .then(res => { console.log(res); return res.json(); })
      .then(res => {
        console.log(res);
        console.log("HOLA")
        setRooms(res)
      })
  }, [])
  const gotoRoom = (id) => {
    console.log("Click", id)
    fetch(`/rooms/${id}.html`)
  }
  return <ProSidebar>
    <Menu iconShape="square">
      <SubMenu title="ROOMS" icon={<FaGem />}>
        {rooms.map(room => <MenuItem icon={<FaGithub/>} key={room.id} onClick={() => gotoRoom(room.id)}>{room.name}</MenuItem>)}
      </SubMenu>
      <SubMenu title="rooms" icon={<FaGem />}>
        {rooms.map(room => <a href={`/rooms/${room.id}`}>{room.name}{room.id}</a>)}
      </SubMenu>

    </Menu>
  </ProSidebar>;
}

export default MyProsidebar;