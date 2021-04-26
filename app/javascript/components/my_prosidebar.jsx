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
  return <ProSidebar>
    <Menu iconShape="square">
      <SubMenu title="ROOMS" icon={<FaGem />}>
        {rooms.map(room => <MenuItem icon={<FaGithub/>} key={room.id}>{room.name}</MenuItem>)}
      </SubMenu>
    </Menu>
  </ProSidebar>;
}

export default MyProsidebar;